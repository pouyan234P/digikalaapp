import 'package:digikalaapp/Feature/Search/Domain/Entity/productEntity.dart';

import '../../../../Core/Resourses/data_state.dart';

abstract class searchProductRepository
{
  Future<DataState<List<searchProductEntity>>> searchProduct(String ? name);
}