import 'package:ecommerce_app/auth/address_screen_controller.dart';
import 'package:ecommerce_app/auth/cart_screen_controller.dart';
import 'package:get/get.dart';

class ConfirmationScreenController extends GetxController {
  final addressScreenController = Get.find<AddressScreenController>();

  final cartScreenController = Get.find<CartScreenController>();

  String name = "", address = "", pincode = "";
  int totalPrice = 0, payablePrice = 0, totalDiscount = 0;

  void initializeData() {
    name = addressScreenController.name;
    address = addressScreenController.address;
    pincode = addressScreenController.pincode;
    totalPrice = cartScreenController.totalPrice;
    payablePrice = cartScreenController.totalSellingPrice;
    totalDiscount = cartScreenController.totalDiscount;
  }

  @override
  void onInit() {
    // TODO: implement onInit
    super.onInit();
    initializeData();
  }
}
