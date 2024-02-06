

import 'package:digikalaapp/Feature/Login/Domain/Entity/loginEntity.dart';
import 'package:digikalaapp/Feature/Login/Domain/Repository/Login/loginRepository.dart';

import '../../../../Core/Resourses/data_state.dart';

class getLoginUsecase
{
  final loginRepository _repository;
  getLoginUsecase(this._repository);
  Future<DataState> Login(loginEntity ? myLoginEntity) async
  {
    return await _repository.Login(myLoginEntity);
  }
}