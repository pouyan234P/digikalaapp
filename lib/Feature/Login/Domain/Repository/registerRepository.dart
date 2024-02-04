

import 'package:digikalaapp/Core/Resourses/data_state.dart';
import 'package:digikalaapp/Feature/Login/Domain/Entity/registerEntity.dart';

abstract class registerRepository
{
  Future<DataState<registerEntity>> register(registerEntity ? myregisterEntity);
}