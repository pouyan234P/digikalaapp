

import 'package:digikalaapp/Feature/ShoppingCart/Domain/Entity/cartDetailShoppingEntity.dart';
import 'package:digikalaapp/Feature/ShoppingCart/Domain/Repository/shoppingRepository.dart';

import '../../../../Core/Resourses/data_state.dart';

class GetShoppingCartUseCase
{
  final shoppingRepository _repository;
  GetShoppingCartUseCase(this._repository);

  Future<DataState<List<cartDetailShoppingEntity>>> callShoppingcart(int ? userid) async
  {
    return await _repository.GetAllShoppingcart(userid);
  }
}