import 'package:json_annotation/json_annotation.dart';

part 'model.g.dart';

// flutter pub run build_runner build
/*
  factory PersonsModel.fromJson(dynamic json) => _$PersonsModelFromJson(json);

  dynamic toJson() => _$PersonsModelToJson(this);
  */

@JsonSerializable()
class Category {
  Category(this.id, this.name, this.description);

  final int id;
  final String name;
  final String description;

  factory Category.fromJson(dynamic json) => _$CategoryFromJson(json);
  dynamic toJson() => _$CategoryToJson(this);

  //Map<String, dynamic> toJson() => CategoryToJson(this);

  /*
  factory CategoriesModel.fromJson(dynamic json) =>
      _$CategoriesModelFromJson(json);
  dynamic toJson() => _$CategoriesModelToJson(this);
*/
  /*
  CategoriesModel.fromJson(Map<String, dynamic> json)
      : id = json['id'] as String,
        name = json['name'] as String,
        description = json['description'] as String;
  Map<String, dynamic> toJson() => {'id': id, 'name': name, 'description': description};
 */
}

@JsonSerializable()
class Person {
  final int id;
  // ignore: non_constant_identifier_names
  final int category_id;
  // ignore: non_constant_identifier_names
  final int city_id;
  final String name;
  final String description;
  final String web;
  final String address;
  final String more;
  final String phone;
  final String ext;

  // ignore: non_constant_identifier_names
  Person({
    required this.id,
    // ignore: non_constant_identifier_names
    required this.category_id,
    // ignore: non_constant_identifier_names
    required this.city_id,
    required this.name,
    required this.description,
    required this.web,
    required this.address,
    required this.more,
    required this.phone,
    required this.ext,
  });

  factory Person.fromJson(dynamic json) => _$PersonFromJson(json);

  dynamic toJson() => _$PersonToJson(this);
}
