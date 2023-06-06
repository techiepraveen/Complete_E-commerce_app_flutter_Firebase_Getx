import 'package:ecommerce_app/screens/my_order_details.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../const/categories.dart';

class MyOrderScreen extends StatelessWidget {
  const MyOrderScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final size = Get.size;

    return Container(
      color: Colors.blueAccent,
      child: SafeArea(
          child: Scaffold(
        appBar: AppBar(
          title: const Text("My Orders"),
          backgroundColor: Colors.blueAccent,
        ),
        body: SizedBox(
          height: size.height,
          width: size.width,
          child: ListView.builder(
              itemCount: 5,
              itemBuilder: (context, index) {
                return listViewBuilderItems(size);
              }),
        ),
      )),
    );
  }

  Widget listViewBuilderItems(
    Size size,
  ) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 10.0, horizontal: 20),
      child: GestureDetector(
        onTap: () {
          Get.to(() => MyOrderDetailsScreen());
        },
        child: Container(
          height: size.height / 8,
          width: size.width / 1.1,
          child: Row(
            children: [
              Container(
                height: size.height / 8,
                width: size.width / 4.5,
                decoration: const BoxDecoration(
                  image: DecorationImage(
                    image: NetworkImage(image),
                  ),
                ),
              ),
              SizedBox(
                width: size.width / 22,
              ),
              Expanded(
                child: SizedBox(
                  child: RichText(
                    text: const TextSpan(
                      text: "ProductName\n",
                      style: TextStyle(
                        fontSize: 18,
                        color: Colors.black,
                        fontWeight: FontWeight.w500,
                      ),
                      children: [
                        TextSpan(
                            text: "Status : Delivered",
                            style: TextStyle(
                                fontSize: 16,
                                color: Colors.green,
                                fontWeight: FontWeight.w500)),
                      ],
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
