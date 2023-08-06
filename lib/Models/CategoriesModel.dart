class CategoriesModel {
  bool? status;
  CategoriesData? data;
  CategoriesModel.fromJson(Map<String, dynamic> json) {
    status = json["status"];
    data = json["data"] != null ? CategoriesData.fromJson(json["data"]) : null;
  }
}

class CategoriesData {
  List<Data>? categoryData;

  CategoriesData.fromJson(Map<String, dynamic> json) {
    if (json["data"] != null) {
      categoryData = <Data>[];
      json["data"].forEach((e) => categoryData!.add(Data.formJson(e)));
    } else {
      null;
    }
  }
}

class Data {
  int? id;
  String? name;
  String? image;

  Data.formJson(Map<String, dynamic> json) {
    id = json["id"];
    name = json["name"];
    image = json["image"];
  }
}
