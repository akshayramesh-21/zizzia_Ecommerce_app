/* 
// Example Usage
Map<String, dynamic> map = jsonDecode(<myJSONString>);
var myRootNode = Root.fromJson(map);
*/ 
// Model
class BannerClass {
  final String id;
  final String image;
  final String description;
  final bool isActive;
  final String first;
  final String second;

  BannerClass({
    required this.id,
    required this.image,
    required this.description,
    required this.isActive,
    required this.first,
    required this.second,
  });

  factory BannerClass.fromJson(Map<String, dynamic> json) {
    return BannerClass(
      id: json['_id']!,
      image: json['image']!,
      description: json['description']!,
      isActive: json['isActive']!,
      first: json['first']!,
      second: json['second']!,
    );
  }
}
