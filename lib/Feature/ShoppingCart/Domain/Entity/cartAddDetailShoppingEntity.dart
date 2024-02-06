

import 'package:digikalaapp/Feature/ShoppingCart/Domain/Entity/cartAddHeaderShoppingEntity.dart';
import 'package:digikalaapp/Feature/ShoppingCart/Domain/Entity/productAddShoppingEntity.dart';
import 'package:equatable/equatable.dart';

class cartAddDetailShoppingEntity extends Equatable
{
  final int ? id ;
  final cartAddHeaderShoppingEntity ? Headerid;
  final productAddShoppingEntity ? productid;
  final int ? Count;
  const cartAddDetailShoppingEntity({
    this.id,
    this.productid,
    this.Headerid,
    this.Count
  });
  @override
  // TODO: implement props
  List<Object?> get props {
    return [
      id,
      Headerid,
      productid,
      Count
    ];
  }
}