

import 'package:digikalaapp/Feature/Product/Domain/Entity/ProductEntity.dart';

import '../../../../Core/Resourses/data_state.dart';

abstract class CategorySearchRepository
{
  Future<DataState<List<ProductEntity>>> getProductsbyname(String ? name);
  Future<DataState<ProductEntity>> getproductbyid(int ? id);
}