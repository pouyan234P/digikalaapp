

import 'package:digikalaapp/Feature/Login/Domain/Entity/loginEntity.dart';


class loginModel extends loginEntity
{
  loginModel({
    String ? Email,
    String ? Password,
    String ? tokken
  }):super(Email: Email,Password: Password,tokken: tokken);
  factory loginModel.fromJson(Map<String,dynamic> map)
  {
    return loginModel(
      tokken:map['token'] ??""
    );
  }
  Map<String, dynamic> toJson() => {'Email': Email, 'Password': Password};
}