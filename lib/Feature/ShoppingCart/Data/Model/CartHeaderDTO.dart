

import 'package:digikalaapp/Feature/ShoppingCart/Domain/Entity/cartAddHeaderShoppingEntity.dart';
import 'package:json_annotation/json_annotation.dart';

class CartHeaderDTO
{
      int ? userid;
  int ? digicouponId;
  CartHeaderDTO({
    this.userid,
    this.digicouponId
});

  Map<String, dynamic> toJson() => {
    'userid': userid ?? 0,
    'digicouponId': digicouponId ?? 0
  };
}