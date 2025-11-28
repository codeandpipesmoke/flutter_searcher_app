// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Category _$CategoryFromJson(Map<String, dynamic> json) => Category(
  json['id'] as String,
  json['name'] as String,
  json['description'] as String,
);

Map<String, dynamic> _$CategoryToJson(Category instance) => <String, dynamic>{
  'id': instance.id,
  'name': instance.name,
  'description': instance.description,
};

Person _$PersonFromJson(Map<String, dynamic> json) => Person(
  id: json['id'] as String,
  category_id: json['category_id'] as String,
  city_id: json['city_id'] as String,
  name: json['name'] as String,
  description: json['description'] as String,
  web: json['web'] as String,
  address: json['address'] as String,
  more: json['more'] as String,
  phone: json['phone'] as String,
  ext: json['ext'] as String,
);

Map<String, dynamic> _$PersonToJson(Person instance) => <String, dynamic>{
  'id': instance.id,
  'category_id': instance.category_id,
  'city_id': instance.city_id,
  'name': instance.name,
  'description': instance.description,
  'web': instance.web,
  'address': instance.address,
  'more': instance.more,
  'phone': instance.phone,
  'ext': instance.ext,
};
