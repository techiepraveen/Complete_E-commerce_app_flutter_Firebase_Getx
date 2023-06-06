import 'package:ecommerce_app/screens/items_screen.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../model/categories_model.dart';

class CategoriesAndFeaturedScreen extends StatelessWidget {
  List<CategoriesModel> model;
  CategoriesAndFeaturedScreen({required this.model, super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.blueAccent,
      child: SafeArea(
          child: Scaffold(
        appBar: AppBar(
          title: const Text("All Categories"),
        ),
        body: Padding(
          padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 12),
          child: GridView.builder(
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2),
            itemCount: model.length,
            itemBuilder: (context, index) {
              return gridlistViewBuilderItem(Get.size, model[index]);
            },
          ),
        ),
      )),
    );
  }

  Widget gridlistViewBuilderItem(Size size, CategoriesModel categories) {
    return GestureDetector(
      onTap: () {
        Get.to(() => ItemsScreen(
              categoryId: categories.id,
              categoryTitle: categories.title,
            ));
      },
      child: Container(
        height: size.height / 7,
        width: size.width / 4.2,
        child: Column(
          children: [
            Container(
              height: size.height / 8,
              width: size.width / 2.2,
              decoration: BoxDecoration(
                  image:
                      DecorationImage(image: NetworkImage(categories.image))),
            ),
            SizedBox(
              height: size.height / 20,
            ),
            Expanded(
                child: SizedBox(
              child: Text(
                categories.title,
                overflow: TextOverflow.ellipsis,
                style: const TextStyle(fontWeight: FontWeight.w500),
              ),
            ))
          ],
        ),
      ),
    );
  }
}
