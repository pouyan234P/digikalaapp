

abstract class RemotesearchProductEvent
{
  const RemotesearchProductEvent();
}
class GetsearchProductEvent extends RemotesearchProductEvent
{
  String name;
   GetsearchProductEvent(this.name);
}