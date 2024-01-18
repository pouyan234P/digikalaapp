

import 'package:digikalaapp/Feature/Product/Domain/Entity/Userpoint/UserpointEntity.dart';
import 'package:digikalaapp/Feature/Product/Domain/Repository/Userpoint/UserPointRepository.dart';

import '../../../../../Core/Resourses/data_state.dart';

class GetUserpointUsecase
{
  final UserPointRepository _repository;
  GetUserpointUsecase(this._repository);

  Future<DataState<List<UserpointEntity>>> callUserpoint(int ? productid) async
  {
    return await _repository.GetUserpoints(productid);
  }
}