

import 'package:digikalaapp/Feature/ShoppingCart/Domain/Entity/cartDetailShoppingEntity.dart';

import '../../../../Core/Resourses/data_state.dart';

abstract class shoppingRepository
{
  Future<DataState<List<cartDetailShoppingEntity>>> GetAllShoppingcart(int ? userid,int ?PageNumber);
}