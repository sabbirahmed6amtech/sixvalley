import 'package:get/get.dart';
import 'package:sixvalley/feature/home_page/model/stores_model.dart';

import '../repository/store_repo.dart';

class StoresController extends GetxController{
  Future<List<StoresModel>> getStoreList() async {
    return StoreRepo.fetchStores();
  }

}