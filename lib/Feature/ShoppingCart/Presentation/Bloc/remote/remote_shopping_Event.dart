

abstract class RemoteShoppingEvent
{
  const RemoteShoppingEvent();
}
class GetShoppingEvent extends RemoteShoppingEvent
{
  final int userid;
  GetShoppingEvent(this.userid);
}