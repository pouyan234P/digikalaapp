

import 'package:digikalaapp/Core/Resourses/data_state.dart';
import 'package:digikalaapp/Feature/Product/Domain/Entity/ProductEntity.dart';
import 'package:digikalaapp/Feature/Product/Domain/Repository/CategorySearchRepository.dart';

class GetCategorySearchUseCase
{
  final CategorySearchRepository  _repository;
  GetCategorySearchUseCase(this._repository);
  @override
  Future<DataState<List<ProductEntity>>> callcategory(String name,int PageNumber) async {
    // TODO: implement call
    return await _repository.getProductsbyname(name, PageNumber);
  }
  Future<DataState<ProductEntity>> calltakproduct(int id) async
  {
    return await _repository.getproductbyid(id);
  }
}