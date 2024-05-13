class ProductAllData {
  String? id;
  String? name;
  String? image;
  String? description;
  int? price;
  int? qty;
  String? category;
  int? v;

  ProductAllData({
    this.id,
    this.name,
    this.image,
    this.description,
    this.price,
    this.qty,
    this.category,
    this.v,
  });

  ProductAllData.fromJson(Map<String, dynamic> json) {
    id = json['_id'];
    name = json['name'];
    image = json['image'];
    description = json['description'];
    price = json['price'];
    qty = json['qty'];
    category = json['category'];
    v = json['__v'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = {};
    data['_id'] = id;
    data['name'] = name;
    data['image'] = image;
    data['description'] = description;
    data['price'] = price;
    data['qty'] = qty;
    data['category'] = category;
    data['__v'] = v;
    return data;
  }
}

class MainAllProduct {
  List<ProductAllData>? product;
  int? totalPages;
  int? currentPage;
  List<int>? pages;

  MainAllProduct({
    this.product,
    this.totalPages,
    this.currentPage,
    this.pages,
  });

  MainAllProduct.fromJson(Map<String, dynamic> json) {
    if (json['product'] != null) {
      product = <ProductAllData>[];
      json['product'].forEach((v) {
        product!.add(ProductAllData.fromJson(v));
      });
    }
    totalPages = json['totalPages'];
    currentPage = json['currentPage'];
    pages = (json['pages'] as List).cast<int>();
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = {};
    data['product'] = product != null ? product!.map((v) => v?.toJson()).toList() : null;
    data['totalPages'] = totalPages;
    data['currentPage'] = currentPage;
    data['pages'] = pages;
    return data;
  }
}
