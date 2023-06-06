import 'package:ecommerce_app/auth/confirmation_screen_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ConfirmationScreen extends StatelessWidget {
  ConfirmationScreen({super.key});

  final controller = Get.put(ConfirmationScreenController());

  @override
  Widget build(BuildContext context) {
    final size = Get.size;
    return Container(
      color: Colors.blueAccent,
      child: SafeArea(
        child: Scaffold(
          appBar: AppBar(
            backgroundColor: Colors.blueAccent,
            title: const Text("Confirmation"),
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
                SizedBox(
                  height: size.height / 30,
                ),
                orderDetails(size),
              ],
            ),
          ),
          bottomNavigationBar: GestureDetector(
            onTap: () {},
            child: Container(
              height: size.height / 12,
              width: size.width / 1.2,
              color: Colors.blueAccent,
              alignment: Alignment.center,
              child: const Text(
                "Pay Now",
                style: TextStyle(
                    fontSize: 21,
                    color: Colors.white,
                    fontWeight: FontWeight.w500),
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
        padding: const EdgeInsets.symmetric(vertical: 20.0),
        child: Container(
          width: size.width / 1.1,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(controller.name, style: TextStyle(fontSize: 18)),
              Text(
                controller.address,
                style: TextStyle(fontSize: 18),
              ),
              Text(controller.pincode, style: TextStyle(fontSize: 18)),
              // GestureDetector(
              //   onTap: () {},
              //   child: Container(
              //     height: size.height / 12,
              //     width: size.width / 1.2,
              //     color: Colors.blueAccent,
              //     alignment: Alignment.center,
              //     child: Text("Edit",
              //         style:
              //             TextStyle(fontSize: 18, fontWeight: FontWeight.w500)),
              //   ),
              // ),
            ],
          ),
        ),
      ),
    );
  }

  Widget orderDetails(Size size) {
    Widget text(String header, String footer) {
      return Row(
        children: [
          Text(
            header,
            style: const TextStyle(fontSize: 18, fontWeight: FontWeight.w500),
          ),
          Text(
            footer,
            style: const TextStyle(fontSize: 18, fontWeight: FontWeight.w500),
          )
        ],
      );
    }

    return Material(
      elevation: 5,
      color: Colors.white,
      child: Container(
        width: size.width / 1.1,
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 15),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text(
                "Price details",
                style: TextStyle(fontSize: 22, fontWeight: FontWeight.w500),
              ),
              SizedBox(
                height: size.height / 40,
              ),
              text("Total Price : ", "${controller.totalPrice}"),
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 8.0),
                child: text("Discount : ", "${controller.totalDiscount}"),
              ),
              text("Payable amount : ", "${controller.payablePrice}")
            ],
          ),
        ),
      ),
    );
  }
}
