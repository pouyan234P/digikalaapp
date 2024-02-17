

import 'package:digikalaapp/Feature/ShoppingCart/Domain/Entity/cartAddDetailShoppingEntity.dart';
import 'package:digikalaapp/Feature/ShoppingCart/Domain/Entity/cartAddHeaderShoppingEntity.dart';
import 'package:digikalaapp/Feature/ShoppingCart/Domain/Entity/cartDetailShoppingEntity.dart';

import '../../../../Core/Resourses/data_state.dart';

abstract class shoppingRepository
{
  Future<DataState<List<cartDetailShoppingEntity>>> GetAllShoppingcart(int ? userid,int ?PageNumber);
  Future<DataState> Addcart(cartAddDetailShoppingEntity ? mycartDetailShoppingEntity);
  Future<DataState> deleteCart(int detailid);
}