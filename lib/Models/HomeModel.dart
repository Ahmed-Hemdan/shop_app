class HomeModel {
  bool? status;
  DataHomeModel? data;
  HomeModel.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    data = json["data"] != null ? DataHomeModel.formJson(json["data"]) : null;
  }
}

class DataHomeModel {
  List<BannerModel>? banners;
  List<ProductModel>? products;
  String? ad;
  DataHomeModel.formJson(Map<String, dynamic> json) {
    banners = json["banners"] != null ? json['banners'].forEach((e)=>banners!.add(e)) : null;
    products = json['products'] != null ? json['products'].forEach((e)=>products!.add(e)) : null;
    ad = json['ad'];
  }
}

class BannerModel {
  int? id;
  String? image;
  BannerModel.fromJson(Map<String, dynamic> json) {
    id = json["id"];
    image = json['image'];
  }
}

class ProductModel {
  int? id;
  dynamic price;
  dynamic oldPrice;
  dynamic discount;
  String? image;
  String? name;
  bool? inFavorites;
  bool? inCart;
  ProductModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    price = json['price'];
    oldPrice = json['old_price'];
    discount = json['discount'];
    image = json['image'];
    name = json['name'];
    inFavorites = json['in_favorites'];
    inCart = json['in_cart'];
  }
}
