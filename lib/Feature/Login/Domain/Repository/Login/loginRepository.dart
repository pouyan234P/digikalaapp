

import 'package:digikalaapp/Feature/Login/Domain/Entity/loginEntity.dart';

import '../../../../../Core/Resourses/data_state.dart';

abstract class loginRepository
{
  Future<DataState> Login(loginEntity ? myLoginEntity);
}