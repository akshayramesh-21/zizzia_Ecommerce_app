class OrderHistroyModel {
  late String id;
  late String orderID;
  late DateTime orderDate;
  late String email;
  late String name;
  late String address;
  late String city;
  late String state;
  late String pincode;
  late String phoneNo;
  late List<OrderItem> items;
  late int total;
  late int totalAmount;
  late String status;
  late String paymentID;

  OrderHistroyModel.fromJson(Map<String, dynamic> json) {
    id = json['_id'] as String;
    orderID = json['orderID'] as String;
    orderDate = DateTime.parse(json['orderdate'] as String);
    email = json['email'] as String;
    name = json['name'] as String;
    address = json['address'] as String;
    city = json['city'] as String;
    state = json['state'] as String;
    pincode = json['pincode'] as String;
    phoneNo = json['phoneno'] as String;
    items = (json['items'] as List<dynamic>).map((item) => OrderItem.fromJson(item)).toList();
    total = json['total'] as int;
    totalAmount = json['totalamount'] as int;
    status = json['status'] as String;
    paymentID = json['paymentID'] as String;
  }
}

class OrderItem {
  late String id;
  late Product product;
  late int quantity;
  late String size;

  OrderItem.fromJson(Map<String, dynamic> json) {
    id = json['_id'] as String;
    product = Product.fromJson(json['product'] as Map<String, dynamic>);
    quantity = json['quantity'] as int;
    size = json['size'] as String;
  }
}

class Product {
  late String id;
  late String name;
  late String image;
  late String description;
  late int price;
  late int qty;
  late String category;

  Product.fromJson(Map<String, dynamic> json) {
    id = json['_id'] as String;
    name = json['name'] as String;
    image = json['image'] as String;
    description = json['description'] as String;
    price = json['price'] as int;
    qty = json['qty'] as int;
    category = json['category'] as String;
  }
}
