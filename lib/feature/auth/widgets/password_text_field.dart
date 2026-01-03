import 'package:flutter/material.dart';
import '../../../utils/dimensions.dart';
import 'custom_text_field.dart';

class PasswordTextField extends StatefulWidget {
  final String? hintText;
  final String? labelText;
  final TextEditingController? controller;
  final String? Function(String?)? validator;
  final void Function(String)? onChanged;
  final bool isRequired;

  const PasswordTextField({
    super.key,
    this.hintText,
    this.labelText,
    this.controller,
    this.validator,
    this.onChanged,
    this.isRequired = false,
  });

  @override
  State<PasswordTextField> createState() => _PasswordTextFieldState();
}

class _PasswordTextFieldState extends State<PasswordTextField> {
  bool _obscureText = true;

  @override
  Widget build(BuildContext context) {
    return CustomTextField(
      hintText: widget.hintText,
      labelText: widget.labelText,
      controller: widget.controller,
      obscureText: _obscureText,
      validator: widget.validator,
      onChanged: widget.onChanged,
      isRequired: widget.isRequired,
      prefixIcon: Icon(
        Icons.lock_outline,
        color: Theme.of(context).primaryColor,
        size: Dimensions.iconSizeDefault,
      ),
      suffixIcon: IconButton(
        icon: Icon(
          _obscureText ? Icons.visibility_off_outlined : Icons.visibility_outlined,
          color: Theme.of(context).hintColor,
          size: Dimensions.iconSizeDefault,
        ),
        onPressed: () {
          setState(() {
            _obscureText = !_obscureText;
          });
        },
      ),
    );
  }
}
