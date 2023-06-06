import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../const/categories.dart';

class MyOrderDetailsScreen extends StatelessWidget {
  const MyOrderDetailsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final Size size = Get.size;
    return Container(
      color: Colors.blueAccent,
      child: SafeArea(
          child: Scaffold(
        appBar: AppBar(
          title: const Text("Product Name"),
          backgroundColor: Colors.blueAccent,
        ),
        body: SizedBox(
          height: size.height,
          width: size.width,
          child: SingleChildScrollView(
            child: Column(
              children: [
                SizedBox(
                  height: size.height / 30,
                ),
                Container(
                    height: size.height / 5,
                    width: size.width / 1.1,
                    decoration: const BoxDecoration(
                        image: DecorationImage(image: NetworkImage(image)))),
                SizedBox(
                  height: size.height / 30,
                ),
                const Text(
                  "Product Name",
                  style: TextStyle(fontSize: 22, fontWeight: FontWeight.w500),
                ),
                SizedBox(
                  height: size.height / 20,
                ),
                orderDetails(size)
              ],
            ),
          ),
        ),
      )),
    );
  }
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
              "Order details",
              style: TextStyle(fontSize: 22, fontWeight: FontWeight.w500),
            ),
            SizedBox(
              height: size.height / 40,
            ),
            text("Order Id : ", "154444"),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 8.0),
              child: text("Total Amount: ", " Rs 15000"),
            ),
            text("Paid Amount : ", "Rs 15000"),
            SizedBox(
              height: size.height / 80,
            ),
            text("Status : ", "Delivered"),
            SizedBox(
              height: size.height / 80,
            ),
            text("Ordered On: ", "26-05-2023"),
            SizedBox(
              height: size.height / 80,
            ),
            text("Delivered on : ", "28-05-2023")
          ],
        ),
      ),
    ),
  );
}
