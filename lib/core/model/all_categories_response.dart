class allCategoriesResponse {
  int? statusCode;
  Data? data;
  Null? error;

  allCategoriesResponse({this.statusCode, this.data, this.error});

  allCategoriesResponse.fromJson(Map<String, dynamic> json) {
    statusCode = json['statusCode'];
    data = json['data'] != null ? new Data.fromJson(json['data']) : null;
    error = json['error'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['statusCode'] = this.statusCode;
    if (this.data != null) {
      data['data'] = this.data!.toJson();
    }
    data['error'] = this.error;
    return data;
  }
}

class Data {
  String? message;
  List<Categories>? categories;

  Data({this.message, this.categories});

  Data.fromJson(Map<String, dynamic> json) {
    message = json['message'];
    if (json['Categories'] != null) {
      categories = <Categories>[];
      json['Categories'].forEach((v) {
        categories!.add(new Categories.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['message'] = this.message;
    if (this.categories != null) {
      data['Categories'] = this.categories!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Categories {
  String? sId;
  String? categoryName;
  String? description;
  String? parentCategoryId;
  String? slug;
  String? categoryImage;
  String? metaTitle;
  String? metaDescription;
  bool? status;
  int? sortOrder;
  bool? isFeatured;
  String? categoryId;
  String? createdAt;
  String? updatedAt;
  int? iV;

  Categories(
      {this.sId,
        this.categoryName,
        this.description,
        this.parentCategoryId,
        this.slug,
        this.categoryImage,
        this.metaTitle,
        this.metaDescription,
        this.status,
        this.sortOrder,
        this.isFeatured,
        this.categoryId,
        this.createdAt,
        this.updatedAt,
        this.iV});

  Categories.fromJson(Map<String, dynamic> json) {
    sId = json['_id'];
    categoryName = json['categoryName'];
    description = json['description'];
    parentCategoryId = json['parentCategoryId'];
    slug = json['slug'];
    categoryImage = json['categoryImage'];
    metaTitle = json['metaTitle'];
    metaDescription = json['metaDescription'];
    status = json['status'];
    sortOrder = json['sortOrder'];
    isFeatured = json['isFeatured'];
    categoryId = json['categoryId'];
    createdAt = json['createdAt'];
    updatedAt = json['updatedAt'];
    iV = json['__v'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['_id'] = this.sId;
    data['categoryName'] = this.categoryName;
    data['description'] = this.description;
    data['parentCategoryId'] = this.parentCategoryId;
    data['slug'] = this.slug;
    data['categoryImage'] = this.categoryImage;
    data['metaTitle'] = this.metaTitle;
    data['metaDescription'] = this.metaDescription;
    data['status'] = this.status;
    data['sortOrder'] = this.sortOrder;
    data['isFeatured'] = this.isFeatured;
    data['categoryId'] = this.categoryId;
    data['createdAt'] = this.createdAt;
    data['updatedAt'] = this.updatedAt;
    data['__v'] = this.iV;
    return data;
  }
}
