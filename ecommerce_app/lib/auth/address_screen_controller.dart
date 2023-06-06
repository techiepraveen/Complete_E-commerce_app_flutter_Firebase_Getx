import 'package:ecommerce_app/const/categories.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';

class AddressScreenController extends GetxController {
  late SharedPreferences _preferences;

  String name = "", address = "", pincode = "";

  TextEditingController nameController = TextEditingController();
  TextEditingController addressController = TextEditingController();
  TextEditingController pincodeController = TextEditingController();
  bool isAddrssAvailable = false;
  Future<void> getInstance() async {
    _preferences = await SharedPreferences.getInstance();

    String address = getString('address');
    if (address.isNotEmpty) {
      isAddrssAvailable = true;
    } else {
      isAddrssAvailable = false;
    }

    initializeInfo();
    update();
  }

  Future onTap() async {
    if (nameController.text.isNotEmpty &&
        addressController.text.isNotEmpty &&
        pincodeController.text.isNotEmpty) {
      saveSting('name', nameController.text);
      saveSting('address', addressController.text);
      saveSting('pincode', pincodeController.text);
      getInstance();
    } else {
      showAlert("All fields are required");
    }
  }

  Future<void> saveSting(String key, String value) async {
    await _preferences.setString(key, value);
  }

  String getString(String key) => _preferences.getString(key) ?? "";

  void initializeInfo() {
    name = getString('name');
    address = getString('address');
    pincode = getString('pincode');
  }

  void onEdit() async {
    isAddrssAvailable = false;
    update();
    await _preferences.clear();
  }

  @override
  void onInit() {
    // TODO: implement onInit
    super.onInit();
    getInstance();
  }
}
