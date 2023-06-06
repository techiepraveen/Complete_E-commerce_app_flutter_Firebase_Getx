class ItemsModel {
  late String id, image, title, detailsID;
  late int totalprice, sellingprice;

  ItemsModel(
      {required this.id,
      required this.image,
      required this.sellingprice,
      required this.title,
      required this.totalprice,
      required this.detailsID});

  ItemsModel.fromJson(Map<String, dynamic> map) {
    id = map['id'];
    image = map['img'];
    sellingprice = map['sell_price'];
    totalprice = map['total_price'];
    title = map['title'];
    detailsID = map['details_id'];
  }
}
