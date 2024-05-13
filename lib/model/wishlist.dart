class WishlistItems {
  List<Wishlist>? wishlist;

  WishlistItems({this.wishlist});

  WishlistItems.fromJson(Map<String, dynamic> json) {
    if (json['wishlist'] != null) {
      wishlist = <Wishlist>[];
      json['wishlist'].forEach((v) {
        wishlist!.add(new Wishlist.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.wishlist != null) {
      data['wishlist'] = this.wishlist!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Wishlist {
  Product? product;
  String? sId;

  Wishlist({this.product, this.sId});

  Wishlist.fromJson(Map<String, dynamic> json) {
    product =
        json['product'] != null ? new Product.fromJson(json['product']) : null;
    sId = json['_id'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.product != null) {
      data['product'] = this.product!.toJson();
    }
    data['_id'] = this.sId;
    return data;
  }
}

class Product {
  String? sId;
  String? name;
  String? image;
  String? description;
  int? price;
  int? qty;
  String? category;
  int? iV;

  Product(
      {this.sId,
      this.name,
      this.image,
      this.description,
      this.price,
      this.qty,
      this.category,
      this.iV});

  Product.fromJson(Map<String, dynamic> json) {
    sId = json['_id'];
    name = json['name'];
    image = json['image'];
    description = json['description'];
    price = json['price'];
    qty = json['qty'];
    category = json['category'];
    iV = json['__v'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['_id'] = this.sId;
    data['name'] = this.name;
    data['image'] = this.image;
    data['description'] = this.description;
    data['price'] = this.price;
    data['qty'] = this.qty;
    data['category'] = this.category;
    data['__v'] = this.iV;
    return data;
  }
}
