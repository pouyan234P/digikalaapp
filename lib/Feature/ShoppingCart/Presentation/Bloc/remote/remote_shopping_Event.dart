

abstract class RemoteShoppingEvent
{
  const RemoteShoppingEvent();
}
class GetShoppingEvent extends RemoteShoppingEvent
{
  final int userid;
  final int PageNumber;
  GetShoppingEvent(this.userid,this.PageNumber);
}