

import 'package:digikalaapp/Feature/Login/Domain/Entity/registerEntity.dart';
import 'package:json_annotation/json_annotation.dart';
part 'RegisterDTO.g.dart';
@JsonSerializable()
class RegisterDTO extends registerEntity
{
  RegisterDTO({
    String ? Password,
    String ? Email,
    String ? Name,
    String ? family,
    String ? Country,
    String ? phoneNumber,
}):super(Name: Name,Country: Country,Email: Email,family: family,Password: Password,phoneNumber: phoneNumber);
  Map<String, dynamic> toJson() =>_$RegisterDTOToJson(this);
}