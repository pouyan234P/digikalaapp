

abstract class remoteRegisterEvent
{
  const remoteRegisterEvent();
}
class getRemoteRegisterEvent extends remoteRegisterEvent
{
  final registerEntity;
  const getRemoteRegisterEvent(this.registerEntity);
}

