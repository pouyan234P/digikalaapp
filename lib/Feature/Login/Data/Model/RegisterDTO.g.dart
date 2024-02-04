// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'RegisterDTO.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

RegisterDTO _$RegisterDTOFromJson(Map<String, dynamic> json) => RegisterDTO(
      Password: json['Password'] as String?,
      Email: json['Email'] as String?,
      Name: json['Name'] as String?,
      family: json['family'] as String?,
      Country: json['Country'] as String?,
      phoneNumber: json['phoneNumber'] as String?,
    );

Map<String, dynamic> _$RegisterDTOToJson(RegisterDTO instance) =>
    <String, dynamic>{
      'Password': instance.Password,
      'Email': instance.Email,
      'Name': instance.Name,
      'family': instance.family,
      'Country': instance.Country,
      'phoneNumber': instance.phoneNumber,
    };
