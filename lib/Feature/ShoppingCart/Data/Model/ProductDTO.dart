

import 'package:digikalaapp/Feature/ShoppingCart/Domain/Entity/productAddShoppingEntity.dart';
import 'package:json_annotation/json_annotation.dart';

class ProductDTO
{
      int ? productid;
  String ? Name ;
      double ? Price;
  String ? Picture;
      String ? Color;
  String ? hashColor;
  ProductDTO({
    this.Name,
    this.Price,
    this.Picture,
    this.Color,
    this.hashColor,
    this.productid
});

  Map<String, dynamic> toJson() => {
    'productid': productid ?? 0,
    'name': Name,
    'picture': Picture,
    'color': Color,
    'price': Price,
    'hashColor': hashColor
  };
}