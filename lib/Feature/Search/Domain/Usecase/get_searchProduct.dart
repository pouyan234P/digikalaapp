

import 'package:digikalaapp/Feature/Search/Domain/Entity/productEntity.dart';
import 'package:digikalaapp/Feature/Search/Domain/Repository/searchProductRepository.dart';

import '../../../../Core/Resourses/data_state.dart';

class GetsearchProductUseCase
{
   searchProductRepository _repository;
  GetsearchProductUseCase(this._repository);

  Future<DataState<List<searchProductEntity>>> searchProduct(String ? name) async
  {
    return _repository.searchProduct(name);
  }
}