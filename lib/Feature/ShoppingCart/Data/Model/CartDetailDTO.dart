

import 'package:digikalaapp/Feature/ShoppingCart/Data/Model/CartHeaderDTO.dart';
import 'package:digikalaapp/Feature/ShoppingCart/Data/Model/ProductDTO.dart';
import 'package:digikalaapp/Feature/ShoppingCart/Domain/Entity/cartAddDetailShoppingEntity.dart';

class CartDetailDTO
{
  CartHeaderDTO ? headerid;
  ProductDTO ? productid;
      int ? Count;
  CartDetailDTO({
    this.productid,
    this.Count,
    this.headerid

});

  Map<String, dynamic> toJson() => {
    'headerid': headerid?.toJson(),
    'productid': productid?.toJson(),
    'count': Count ?? 0
  };
}