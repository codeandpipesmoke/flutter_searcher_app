import 'package:json_annotation/json_annotation.dart';

part 'model.g.dart';

// flutter pub run build_runner build
/*
  factory PersonsModel.fromJson(dynamic json) => _$PersonsModelFromJson(json);

  dynamic toJson() => _$PersonsModelToJson(this);
  */

@JsonSerializable()
class Category {
  Category(this.id, this.icon_id, this.icon_ext, this.name, this.description);

  final int id;
  // ignore: non_constant_identifier_names
  final int icon_id;
  // ignore: non_constant_identifier_names
  final String icon_ext;
  final String name;
  final String description;

  factory Category.fromJson(dynamic json) => _$CategoryFromJson(json);
  dynamic toJson() => _$CategoryToJson(this);
}

@JsonSerializable()
class Company {
  Company(
    this.id,
    // ignore: non_constant_identifier_names
    this.icon_id,
    // ignore: non_constant_identifier_names
    this.icon_ext,
    // ignore: non_constant_identifier_names
    this.name,
    this.description,
    // ignore: non_constant_identifier_names
    this.city_zip,
    // ignore: non_constant_identifier_names
    this.city_name,
    this.address,
    // ignore: non_constant_identifier_names
    this.house_number,
    this.phone,
    this.phone2,
    this.web,
    this.email,
    // ignore: non_constant_identifier_names
    this.google_map_url,
    this.longitude,
    this.latitude,
  );

  final int id;
  // ignore: non_constant_identifier_names
  final int icon_id;
  // ignore: non_constant_identifier_names
  final String icon_ext;
  final String name;
  final String description;
  // ignore: non_constant_identifier_names
  final String city_zip;
  // ignore: non_constant_identifier_names
  final String city_name;
  final String address;
  // ignore: non_constant_identifier_names
  final String house_number;
  final String phone;
  final String phone2;
  final String web;
  final String email;
  // ignore: non_constant_identifier_names
  final String google_map_url;
  final String longitude;
  final String latitude;

  factory Company.fromJson(dynamic json) => _$CompanyFromJson(json);
  dynamic toJson() => _$CompanyToJson(this);
}

@JsonSerializable()
class Person {
  final int id;
  // ignore: non_constant_identifier_names
  final int icon_id;
  // ignore: non_constant_identifier_names
  final int category_id;
  final String name;
  final String description;
  final String openingTime;
  final String phone;
  final String phone2;
  final String phone3;
  final String phone4;
  final String phone5;
  final String email;
  final String email2;
  final String web;
  final String facebook;
  final String youtube;

  // ignore: non_constant_identifier_names
  Person({
    required this.id,
    // ignore: non_constant_identifier_names
    required this.icon_id,
    // ignore: non_constant_identifier_names
    required this.category_id,
    required this.name,
    required this.description,
    required this.openingTime,
    required this.phone,
    required this.phone2,
    required this.phone3,
    required this.phone4,
    required this.phone5,
    required this.email,
    required this.email2,
    required this.web,
    required this.facebook,
    required this.youtube,
  });

  factory Person.fromJson(dynamic json) => _$PersonFromJson(json);
  dynamic toJson() => _$PersonToJson(this);
}
