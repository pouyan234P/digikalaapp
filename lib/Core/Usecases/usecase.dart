abstract class UseCase<Type,Params>
{
  Future<Type> call({Params params});
  Future<Type> callname({Params params,String ? name});
}