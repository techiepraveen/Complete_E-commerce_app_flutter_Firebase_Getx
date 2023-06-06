import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:ecommerce_app/model/item_details_model.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ItemDetailsController extends GetxController {
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;
  final FirebaseAuth _auth = FirebaseAuth.instance;

  late ItemDetailsModel model;
  bool isLoading = true, isAlreadyAvailable = false;
  int discount = 0;

  Future<void> getItemDetails(String id) async {
    try {
      await _firestore.collection('products').doc(id).get().then((value) {
        model = ItemDetailsModel.fromJson(value.data()!);
        discount = calculateDiscount(model.totalPrice, model.sellingPrice);
        isLoading = false;
        update();

        checkIfAlreadyIncart();
      });
    } catch (e) {
      print(e);
    }
  }

  Future<void> checkIfAlreadyIncart() async {
    try {
      await _firestore
          .collection('users')
          .doc(_auth.currentUser!.uid)
          .collection('cart')
          .where('id', isEqualTo: model.id)
          .get()
          .then((value) {
        if (value.docs.isNotEmpty) {
          isAlreadyAvailable = true;
        }

        isLoading = false;
        update();
      });
    } catch (e) {
      print(e);
    }
  }

  Future<void> addItemsTocart() async {
    isLoading = true;
    update();
    try {
      await _firestore
          .collection('users')
          .doc(_auth.currentUser!.uid)
          .collection('cart')
          .doc(model.id)
          .set({'id': model.id}).then((value) {
        checkIfAlreadyIncart();
      });
    } catch (e) {
      print(e);
    }
  }

  int calculateDiscount(int totalPrice, int sellingPrice) {
    double discount = ((totalPrice - sellingPrice) / totalPrice) * 100;

    return discount.toInt();
  }
}
