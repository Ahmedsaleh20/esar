import 'dart:convert';

// ignore_for_file: public_member_api_docs, sort_constructors_first
class ItemModel {
String title;
String subTitle;
String image;
  ItemModel({
    required this.title,
    required this.subTitle,
    required this.image,
  });


  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'title': title,
      'subTitle': subTitle,
      'image': image,
    };
  }

  factory ItemModel.fromMap(Map<String, dynamic> map) {
    return ItemModel(
      title: map['title'] as String,
      subTitle: map['subTitle'] as String,
      image: map['image'] as String,
    );
  }

  String toJson() => json.encode(toMap());

  factory ItemModel.fromJson(String source) => ItemModel.fromMap(json.decode(source) as Map<String, dynamic>);
}
