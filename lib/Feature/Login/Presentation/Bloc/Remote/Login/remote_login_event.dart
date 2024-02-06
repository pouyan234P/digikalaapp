

abstract class remoteLoginEvent
{
 const remoteLoginEvent();
}
class getRemoteLoginEvent extends remoteLoginEvent
{
  final loginEntity;
  const getRemoteLoginEvent(this.loginEntity);
}