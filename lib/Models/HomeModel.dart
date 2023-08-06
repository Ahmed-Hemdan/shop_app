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
    if (json["banners"] != null) {
      banners = <BannerModel>[];
      json["banners"].forEach(
        (e) => banners!.add(
          BannerModel.fromJson(e),
        ),
      );
    } else {
      products = null;
    }
    if (json['products'] != null) {
      products = <ProductModel>[];
       json['products'].forEach(
        (e) => products!.add(
          ProductModel.fromJson(e),
        ),
      );
    } else {
      products = null;
    }
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
  double? price;
  double? oldPrice;
  double? discount;
  String? image;
  String? name;
  bool? inFavorites;
  bool? inCart;
  ProductModel.fromJson(Map<String, dynamic> json) {
    id = json['id'] ?? 1;
    price = json['price'].toDouble() ?? 20;
    oldPrice = json['old_price'].toDouble() ?? 20;
    discount = json['discount'].toDouble() ?? 20;
    image = json['image'] ?? "";
    name = json['name'] ?? '';
    inFavorites = json['in_favorites'] ?? false;
    inCart = json['in_cart'] ?? false;
  }
}
