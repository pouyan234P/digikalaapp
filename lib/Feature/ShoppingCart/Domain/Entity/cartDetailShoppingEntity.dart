

import 'package:digikalaapp/Feature/ShoppingCart/Domain/Entity/cartHeaderShoppingEntity.dart';
import 'package:digikalaapp/Feature/ShoppingCart/Domain/Entity/productShoppingEntity.dart';
import 'package:equatable/equatable.dart';

class cartDetailShoppingEntity extends Equatable
{
  final int ? id ;
final cartHeaderShoppingEntity ? Headerid;
final productShoppingEntity ? productid;
final int ? Count;
const cartDetailShoppingEntity({
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