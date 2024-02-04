

import 'package:digikalaapp/Feature/Login/Domain/Entity/registerEntity.dart';
import 'package:digikalaapp/Feature/Login/Domain/Repository/registerRepository.dart';

import '../../../../Core/Resourses/data_state.dart';

class getRegisterUsecase
{
  final registerRepository _repository;
  getRegisterUsecase(this._repository);
  Future<DataState> Register(registerEntity ? registerEntity) async
  {
    return await _repository.register(registerEntity);
  }
}