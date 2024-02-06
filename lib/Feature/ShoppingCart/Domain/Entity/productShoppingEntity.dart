

import 'package:equatable/equatable.dart';

class productShoppingEntity extends Equatable
{
  final int? id;
final int? productid;
final String ? Name ;
final double? Price;
final String ? Picture;
final String ? Color;
final String? hashColor ;
const productShoppingEntity({

  this.productid,
  this.Name,
  this.Color,
  this.Price,
  this.hashColor,
  this.Picture,
  this.id,
});
  @override
  // TODO: implement props
  List<Object?> get props{
    return [
      Color,
      id,
      Name,
      Color,
      Price,
      hashColor,
      Picture
    ];
  }

}