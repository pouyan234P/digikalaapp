

abstract class RemoteuserpointEvent
{
  const RemoteuserpointEvent();
}
class GetRemoteuserpointEvent extends RemoteuserpointEvent
{
  final int id;
  const GetRemoteuserpointEvent(this.id);
}