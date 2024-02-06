

import 'package:digikalaapp/Feature/ShoppingCart/Domain/Entity/cartAddDetailShoppingEntity.dart';
import 'package:digikalaapp/Feature/ShoppingCart/Domain/Entity/cartDetailShoppingEntity.dart';

abstract class RemoteShoppingEvent
{
  const RemoteShoppingEvent();
}
class GetShoppingEvent extends RemoteShoppingEvent
{
  final int userid;
  final int PageNumber;
  GetShoppingEvent(this.userid,this.PageNumber);
}
class getAddShoppingEvent extends RemoteShoppingEvent
{
  final cartAddDetailShoppingEntity cartdetail;
  getAddShoppingEvent(this.cartdetail);
}