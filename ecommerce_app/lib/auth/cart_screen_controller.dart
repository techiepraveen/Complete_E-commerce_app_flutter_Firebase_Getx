import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:ecommerce_app/model/item_details_model.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:get/get.dart';

class CartScreenController extends GetxController {
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;
  final FirebaseAuth _auth = FirebaseAuth.instance;

  List productIds = [];
  List<ItemDetailsModel> productsDetails = [];
  bool isLoading = true;
  int totalPrice = 0, totalDiscount = 0, totalSellingPrice = 0;

  Future<void> getCartItems() async {
    productsDetails = [];
    productIds = [];
    try {
      await _firestore
          .collection('users')
          .doc(_auth.currentUser!.uid)
          .collection('cart')
          .get()
          .then((value) {
        productIds = value.docs.map((e) => e.data()['id']).toList();
        getProductDetails();
      });
    } catch (e) {
      print(e);
    }
  }

  Future<void> getProductDetails() async {
    for (var item in productIds) {
      try {
        await _firestore.collection('products').doc(item).get().then((value) {
          productsDetails.add(ItemDetailsModel.fromJson(value.data()!));
        });
      } catch (e) {
        print(e);
      }
    }

    CalculatePrice();
    isLoading = false;
    update();
  }

  int calculateDiscount(int totalPrice, int sellingPrice) {
    double discount = ((totalPrice - sellingPrice) / totalPrice) * 100;

    return discount.toInt();
  }

  Future<void> removeFromCart(String id) async {
    isLoading = true;
    update();
    try {
      await _firestore
          .collection('users')
          .doc(_auth.currentUser!.uid)
          .collection('cart')
          .doc(id)
          .delete()
          .then((value) {
        getCartItems();
      });
    } catch (e) {
      print(e);
    }
  }

  void CalculatePrice() {
    for (var item in productsDetails) {
      totalPrice = totalPrice + item.totalPrice;
      totalSellingPrice = totalSellingPrice + item.sellingPrice;
    }

    totalDiscount = totalPrice - totalSellingPrice;
  }

  @override
  void onInit() {
    super.onInit();
    getCartItems();
  }
}
