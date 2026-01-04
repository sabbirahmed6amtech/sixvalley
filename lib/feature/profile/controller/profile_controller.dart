import 'dart:convert';
import 'dart:io';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import '../model/profile_model.dart';
import '../repository/profile_repository.dart';

class ProfileController extends GetxController {
  final ProfileRepository profileRepository;

  ProfileController({required this.profileRepository});

  final Rx<ProfileModel?> _profileModel = Rx<ProfileModel?>(null);
  ProfileModel? get profileModel => _profileModel.value;

  final RxBool _isLoading = false.obs;
  bool get isLoading => _isLoading.value;

  final Rx<File?> _selectedImageFile = Rx<File?>(null);
  File? get selectedImageFile => _selectedImageFile.value;

  @override
  void onInit() {
    super.onInit();
    getProfile();
  }

  Future<void> getProfile() async {
    _isLoading.value = true;
    update();
    try {
      final response = await profileRepository.getProfile();
      _isLoading.value = false;
      update();
      if (response.statusCode == 200) {
        final data = jsonDecode(response.body);
        _profileModel.value = ProfileModel.fromJson(data);
        update();
      } else {
        final data = jsonDecode(response.body);
        _showToast(data['message'] ?? 'Failed to load profile', isError: true);
      }
    } catch (e) {
      _isLoading.value = false;
      update();
      _showToast('Error: ${e.toString()}', isError: true);
    }
  }

  Future<void> updateProfile({
    String? firstName,
    String? lastName,
    String? email,
    bool updateImage = false,
  }) async {
    if (updateImage && _selectedImageFile.value == null) {
      _showToast('Please select an image first', isError: true);
      return;
    }

    _isLoading.value = true;
    update();

    try {
      Map<String, String> body = {
        'f_name': firstName ?? _profileModel.value?.fName ?? '',
        'l_name': lastName ?? _profileModel.value?.lName ?? '',
        'email': email ?? _profileModel.value?.email ?? '',
        'phone': _profileModel.value?.phone ?? '',
      };

      if (updateImage && _selectedImageFile.value != null) {
        body['_method'] = 'PUT';

        final response = await profileRepository.updateProfileWithImage(
          body,
          _selectedImageFile.value!,
        );

        final responseData = await response.stream.bytesToString();
        _isLoading.value = false;
        update();

        if (response.statusCode == 200) {
          final data = jsonDecode(responseData);
          _showToast(
            data['message'] ?? 'Profile updated successfully',
            isError: false,
          );

          _selectedImageFile.value = null;
          await getProfile();
        } else {
          final data = jsonDecode(responseData);
          _showToast(
            data['message'] ?? 'Failed to update profile',
            isError: true,
          );
        }
      } else {

        final response = await profileRepository.updateProfile(body);
        _isLoading.value = false;
        update();
        if (response.statusCode == 200) {
          final data = jsonDecode(response.body);
          _showToast(
            data['message'] ?? 'Profile updated successfully',
            isError: false,
          );
          await getProfile();
        } else {
          final data = jsonDecode(response.body);
          _showToast(
            data['message'] ?? 'Failed to update profile',
            isError: true,
          );
        }
      }
    } catch (e) {
      _isLoading.value = false;
      update();
      _showToast('Error: ${e.toString()}', isError: true);
    }
  }

  Future<void> pickImageForPreview() async {
    try {
      final ImagePicker picker = ImagePicker();
      final XFile? image = await picker.pickImage(
        source: ImageSource.gallery,
        maxWidth: 1024,
        maxHeight: 1024,
        imageQuality: 85,
      );

      if (image == null) return;

      _selectedImageFile.value = File(image.path);
      update();

      // _showToast('Image selected. Click Update Image to save', isError: false);
    } catch (e) {
      // _showToast('Error selecting image: ${e.toString()}', isError: true);
    }
  }

  void clearSelectedImage() {
    _selectedImageFile.value = null;
    update();
  }

  void _showToast(String message, {required bool isError}) {
    Fluttertoast.showToast(
      msg: message,
      toastLength: Toast.LENGTH_SHORT,
      gravity: ToastGravity.BOTTOM,
      backgroundColor: isError ? Colors.red : Colors.green,
      textColor: Colors.white,
      fontSize: 16.0,
    );
  }
}
