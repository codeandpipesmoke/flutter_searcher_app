// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Category _$CategoryFromJson(Map<String, dynamic> json) => Category(
  (json['id'] as num).toInt(),
  (json['icon_id'] as num).toInt(),
  json['name'] as String,
  json['description'] as String,
);

Map<String, dynamic> _$CategoryToJson(Category instance) => <String, dynamic>{
  'id': instance.id,
  'icon_id': instance.icon_id,
  'name': instance.name,
  'description': instance.description,
};

Company _$CompanyFromJson(Map<String, dynamic> json) => Company(
  (json['id'] as num).toInt(),
  (json['icon_id'] as num?)?.toInt(),
  json['name'] as String,
  json['description'] as String,
  json['address'] as String?,
  json['houseNumber'] as String?,
  json['phone'] as String?,
  json['phone2'] as String?,
  json['web'] as String?,
  json['email'] as String?,
  json['googleMapUrl'] as String?,
  json['longitude'] as String?,
  json['latitude'] as String?,
);

Map<String, dynamic> _$CompanyToJson(Company instance) => <String, dynamic>{
  'id': instance.id,
  'icon_id': instance.icon_id,
  'name': instance.name,
  'description': instance.description,
  'address': instance.address,
  'houseNumber': instance.houseNumber,
  'phone': instance.phone,
  'phone2': instance.phone2,
  'web': instance.web,
  'email': instance.email,
  'googleMapUrl': instance.googleMapUrl,
  'longitude': instance.longitude,
  'latitude': instance.latitude,
};

Person _$PersonFromJson(Map<String, dynamic> json) => Person(
  id: (json['id'] as num).toInt(),
  icon_id: (json['icon_id'] as num).toInt(),
  category_id: (json['category_id'] as num).toInt(),
  name: json['name'] as String,
  description: json['description'] as String,
  openingTime: json['openingTime'] as String,
  phone: json['phone'] as String,
  phone2: json['phone2'] as String,
  phone3: json['phone3'] as String,
  phone4: json['phone4'] as String,
  phone5: json['phone5'] as String,
  email: json['email'] as String,
  email2: json['email2'] as String,
  web: json['web'] as String,
  facebook: json['facebook'] as String,
  youtube: json['youtube'] as String,
);

Map<String, dynamic> _$PersonToJson(Person instance) => <String, dynamic>{
  'id': instance.id,
  'icon_id': instance.icon_id,
  'category_id': instance.category_id,
  'name': instance.name,
  'description': instance.description,
  'openingTime': instance.openingTime,
  'phone': instance.phone,
  'phone2': instance.phone2,
  'phone3': instance.phone3,
  'phone4': instance.phone4,
  'phone5': instance.phone5,
  'email': instance.email,
  'email2': instance.email2,
  'web': instance.web,
  'facebook': instance.facebook,
  'youtube': instance.youtube,
};
