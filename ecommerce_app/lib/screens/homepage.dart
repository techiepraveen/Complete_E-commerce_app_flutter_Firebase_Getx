import 'package:ecommerce_app/auth/homescreen_controller.dart';
import 'package:ecommerce_app/const/categories.dart';
import 'package:ecommerce_app/screens/categories_and_featured_screen.dart';
import 'package:ecommerce_app/screens/drawer.dart';
import 'package:ecommerce_app/screens/items_screen.dart';
import 'package:ecommerce_app/screens/my_order_screen.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../model/categories_model.dart';
import 'cart_screen.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    final Size size = Get.size;
    final controller = Get.put(HomeScreenController());
    return Container(
      color: Colors.white,
      child: SafeArea(
        child: GetBuilder<HomeScreenController>(builder: (Value) {
          if (!Value.isLoading) {
            return Scaffold(
              appBar: AppBar(
                backgroundColor: Colors.blueAccent,
                title: const Text("Ecommerce App"),
                actions: [
                  IconButton(
                      onPressed: () {
                        Get.to(() => MyOrderScreen());
                      },
                      icon: const Icon(Icons.shopping_bag)),
                  IconButton(
                      onPressed: () {
                        Get.to(() => CartScreen());
                      },
                      icon: const Icon(Icons.shopping_cart))
                ],
              ),
              drawer: HomeScreenDrawer(),

              //banner
              body: SizedBox(
                height: size.height,
                width: size.width,
                child: SingleChildScrollView(
                  child: Column(
                    children: [
                      SizedBox(
                        height: size.height / 3,
                        width: size.width / 1.1,
                        child: PageView.builder(
                            onPageChanged: controller.changeIndicator,
                            itemCount: controller.bannerData.length,
                            itemBuilder: (context, index) {
                              return Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Container(
                                  decoration: BoxDecoration(
                                      image: DecorationImage(
                                          image: NetworkImage(controller
                                              .bannerData[index].image))),
                                ),
                              );
                            }),
                      ),
                      //indicator
                      SizedBox(
                          height: size.height / 22,
                          width: size.width,
                          child: Obx((() {
                            return Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                for (int i = 0;
                                    i < controller.isSelected.length;
                                    i++)
                                  indicator(
                                      size, controller.isSelected[i].value)
                              ],
                            );
                          }))),

                      //categories
                      categoriesTitle(size, "All categories", () {
                        Get.to(() => CategoriesAndFeaturedScreen(
                              model: controller.categoriesData,
                            ));
                      }),
                      listViewBuilder(size, controller.categoriesData),
                      SizedBox(
                        height: size.height / 25,
                      ),
                      categoriesTitle(size, "Featured", () {
                        Get.to(() => CategoriesAndFeaturedScreen(
                              model: controller.featuredData,
                            ));
                      }),
                      listViewBuilder(size, controller.featuredData),
                    ],
                  ),
                ),
              ),
            );
          } else {
            return const Scaffold(
                body: Center(child: CircularProgressIndicator()));
          }
        }),
      ),
    );
  }

  Widget listViewBuilder(Size size, List<CategoriesModel> data) {
    return SizedBox(
      height: size.height / 7,
      width: size.width,
      child: ListView.builder(
          scrollDirection: Axis.horizontal,
          itemCount: data.length,
          itemBuilder: (context, index) {
            return listViewBuilderItem(size, data[index]);
          }),
    );
  }

  Widget listViewBuilderItem(Size size, CategoriesModel categories) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: GestureDetector(
        onTap: () {
          Get.to(() => ItemsScreen(
                categoryId: categories.id,
                categoryTitle: categories.title,
              ));
        },
        child: SizedBox(
          height: size.height / 7,
          width: size.width / 4.2,
          child: Column(
            children: [
              Container(
                height: size.height / 16,
                width: size.width / 2.2,
                decoration: BoxDecoration(
                    image:
                        DecorationImage(image: NetworkImage(categories.image))),
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
      ),
    );
  }

  Widget categoriesTitle(Size size, String title, Function function) {
    return SizedBox(
      height: size.height / 17,
      width: size.width / 1.05,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(title),
          TextButton(
            onPressed: () => function(),
            child: const Text("View more"),
          )
        ],
      ),
    );
  }

  Widget indicator(Size size, bool isSelected) {
    return Padding(
      padding: const EdgeInsets.all(2.0),
      child: Container(
        height: isSelected ? size.height / 80 : size.height / 100,
        width: isSelected ? size.height / 80 : size.height / 100,
        decoration:
            const BoxDecoration(shape: BoxShape.circle, color: Colors.black),
      ),
    );
  }
}
