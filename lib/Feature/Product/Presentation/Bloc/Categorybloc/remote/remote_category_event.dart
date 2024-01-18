

abstract class RemoteCategoryEvent
{
  const RemoteCategoryEvent();
}
class GetCategoryProductEvent extends RemoteCategoryEvent
{
  final String name;
  const GetCategoryProductEvent(this.name);
}
class GetSingleProductEvent extends RemoteCategoryEvent
{
  final int id;
  const GetSingleProductEvent(this.id);
}