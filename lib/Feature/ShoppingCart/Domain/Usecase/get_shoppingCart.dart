

import 'package:digikalaapp/Feature/ShoppingCart/Domain/Entity/cartAddDetailShoppingEntity.dart';
import 'package:digikalaapp/Feature/ShoppingCart/Domain/Entity/cartAddHeaderShoppingEntity.dart';
import 'package:digikalaapp/Feature/ShoppingCart/Domain/Entity/cartDetailShoppingEntity.dart';
import 'package:digikalaapp/Feature/ShoppingCart/Domain/Repository/shoppingRepository.dart';

import '../../../../Core/Resourses/data_state.dart';

class GetShoppingCartUseCase
{
  final shoppingRepository _repository;
  GetShoppingCartUseCase(this._repository);

  Future<DataState<List<cartDetailShoppingEntity>>> callShoppingcart(int ? userid, int ?PageNumber) async
  {
    return await _repository.GetAllShoppingcart(userid,PageNumber);
  }
  Future<DataState> Addcart(cartAddDetailShoppingEntity ? mycartDetailShoppingEntity) async
  {
    return await _repository.Addcart(mycartDetailShoppingEntity );
  }
  Future<DataState> deleteShoppingcart(int ? detailid) async
  {
    return await _repository.deleteCart(detailid!);
  }
}