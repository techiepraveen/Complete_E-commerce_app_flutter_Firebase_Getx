class ItemDetailsModel {
  late String id, title, img, deliveryDays, description;
  late List banners;
  late int sellingPrice, totalPrice;

  ItemDetailsModel(
      {required this.banners,
      required this.deliveryDays,
      required this.description,
      required this.id,
      required this.img,
      required this.sellingPrice,
      required this.title,
      required this.totalPrice});

  ItemDetailsModel.fromJson(Map<String, dynamic> map) {
    id = map['id'];
    title = map['title'];
    img = map['img'];
    deliveryDays = map['delivery_date'];
    description = map['des'];
    sellingPrice = map['sell_price'];
    totalPrice = map['total_price'];
    banners = map['banners'];
  }
}
