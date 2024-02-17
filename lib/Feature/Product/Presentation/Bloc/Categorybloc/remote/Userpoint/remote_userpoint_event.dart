

import 'package:digikalaapp/Feature/Product/Domain/Entity/Userpoint/UserpointEntity.dart';

abstract class RemoteuserpointEvent
{
  const RemoteuserpointEvent();
}
class GetRemoteuserpointEvent extends RemoteuserpointEvent
{
  final int id;
  const GetRemoteuserpointEvent(this.id);
}
class GetRemoteuserpointAddEvent extends RemoteuserpointEvent
{
  final UserpointEntity userpointEntity;
  const GetRemoteuserpointAddEvent(this.userpointEntity);
}