

import 'package:equatable/equatable.dart';

class registerEntity extends Equatable
{
  String ? Password;
  String ? Email;
  String ? Name;
  String ? family;
  String ? Country;
  String ? phoneNumber;
  registerEntity({
    this.Name,
    this.Country,
    this.Email,
    this.family,
    this.Password,
    this.phoneNumber,
});
  @override
  // TODO: implement props
  List<Object?> get props {
    return [
      Email,
      Country,
      Name,
      family,
      phoneNumber,
      Password
    ];
  }
}