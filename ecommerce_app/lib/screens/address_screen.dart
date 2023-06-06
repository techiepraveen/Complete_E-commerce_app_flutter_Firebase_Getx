import 'package:ecommerce_app/auth/address_screen_controller.dart';
import 'package:ecommerce_app/screens/confirmation_screen.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class AddressScreen extends StatelessWidget {
  AddressScreen({super.key});

  bool isAddingAddress = false;

  @override
  Widget build(BuildContext context) {
    return GetBuilder<AddressScreenController>(
        init: AddressScreenController(),
        builder: (value) {
          if (value.isAddrssAvailable) {
            return EditAddressScreen();
          } else {
            return AddAdressScreen();
          }
        });
    // if (isAddingAddress) {
    //   return AddAdressScreen();
    // } else {
    //   return EditAddressScreen();
    // }
  }
}

class AddAdressScreen extends StatelessWidget {
  AddAdressScreen({super.key});

  final controller = Get.find<AddressScreenController>();

  @override
  Widget build(BuildContext context) {
    final size = Get.size;
    return Container(
      color: Colors.blueAccent,
      child: SafeArea(
        child: Scaffold(
          appBar: AppBar(
            backgroundColor: Colors.blueAccent,
            title: const Text("Address"),
          ),
          body: SizedBox(
            height: size.height,
            width: size.width,
            child: Column(
              children: [
                SizedBox(
                  height: size.height / 30,
                ),
                SizedBox(
                  height: size.height / 11,
                  width: size.width / 1.1,
                  child: TextField(
                    controller: controller.nameController,
                    maxLength: 15,
                    decoration: const InputDecoration(
                      hintText: "Full name",
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.all(Radius.circular(5))),
                    ),
                  ),
                ),
                SizedBox(
                  height: size.height / 30,
                ),
                SizedBox(
                  height: size.height / 5,
                  width: size.width / 1.1,
                  child: TextField(
                    controller: controller.addressController,
                    maxLines: 15,
                    decoration: const InputDecoration(
                      hintText: "Address",
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.all(Radius.circular(5))),
                    ),
                  ),
                ),
                SizedBox(
                  height: size.height / 30,
                ),
                SizedBox(
                  height: size.height / 11,
                  width: size.width / 1.1,
                  child: TextField(
                    controller: controller.pincodeController,
                    maxLength: 15,
                    decoration: const InputDecoration(
                      hintText: "Pincode",
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.all(Radius.circular(5))),
                    ),
                  ),
                ),
              ],
            ),
          ),
          bottomNavigationBar: GestureDetector(
            onTap: () {
              controller.onTap();
            },
            child: Container(
              height: size.height / 12,
              color: Colors.blueAccent,
              alignment: Alignment.center,
              child: const Text(
                "Proceed",
                style: TextStyle(
                    fontSize: 24,
                    color: Colors.white,
                    fontWeight: FontWeight.bold),
              ),
            ),
          ),
        ),
      ),
    );
  }
}

class EditAddressScreen extends StatelessWidget {
  EditAddressScreen({super.key});

  final controller = Get.find<AddressScreenController>();

  @override
  Widget build(BuildContext context) {
    final size = Get.size;
    return Container(
      color: Colors.blueAccent,
      child: SafeArea(
        child: Scaffold(
          appBar: AppBar(
            backgroundColor: Colors.blueAccent,
            title: const Text("Address"),
          ),
          body: SizedBox(
            height: size.height,
            width: size.width,
            child: Column(
              children: [
                SizedBox(
                  height: size.height / 30,
                ),
                addressCard(size),
              ],
            ),
          ),
          bottomNavigationBar: GestureDetector(
            onTap: () {
              Get.to(() => ConfirmationScreen());
            },
            child: Container(
              height: size.height / 12,
              color: Colors.blueAccent,
              alignment: Alignment.center,
              child: const Text(
                "Proceed",
                style: TextStyle(
                    fontSize: 18,
                    color: Colors.white,
                    fontWeight: FontWeight.bold),
              ),
            ),
          ),
        ),
      ),
    );
  }

  Widget addressCard(Size size) {
    return Material(
      elevation: 5,
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 20.0, horizontal: 18.0),
        child: Container(
          width: size.width * 1.1,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(controller.name, style: const TextStyle(fontSize: 18)),
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 8.0),
                child: Text(
                  controller.address,
                  style: const TextStyle(fontSize: 18),
                ),
              ),
              Text(controller.pincode, style: const TextStyle(fontSize: 18)),
              GestureDetector(
                onTap: () {
                  controller.onEdit();
                },
                child: Container(
                  height: size.height / 12,
                  width: size.width / 1.2,
                  color: Colors.blueAccent,
                  alignment: Alignment.center,
                  child: const Text("Edit",
                      style:
                          TextStyle(fontSize: 18, fontWeight: FontWeight.w500)),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
