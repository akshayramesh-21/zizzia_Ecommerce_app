class Searchitem {
  final List<Item> items;

  Searchitem({required this.items});

  factory Searchitem.fromJson(List<dynamic> json) {
    List<Item> itemsList = json.map((item) => Item.fromJson(item)).toList();
    return Searchitem(items: itemsList);
  }
}

class Item {
  final String id;
  final String name;
  final String image;
  final String description;
  final int price;
  final int qty;
  final String category;

  Item({
    required this.id,
    required this.name,
    required this.image,
    required this.description,
    required this.price,
    required this.qty,
    required this.category,
  });

  factory Item.fromJson(Map<String, dynamic> json) {
    return Item(
      id: json['_id'],
      name: json['name'],
      image: json['image'],
      description: json['description'],
      price: json['price'],
      qty: json['qty'],
      category: json['category'],
    );
  }
}
