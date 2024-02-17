
import 'package:digikalaapp/Feature/Product/Domain/Entity/Userpoint/UserpointEntity.dart';

import '../../../../../Core/Resourses/data_state.dart';

abstract class UserPointRepository
{
  Future<DataState<List<UserpointEntity>>> GetUserpoints(int ? productid);
  Future<DataState> addUserpoint(UserpointEntity ? userpointEntity);
}