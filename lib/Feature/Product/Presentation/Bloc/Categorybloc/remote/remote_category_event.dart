

abstract class RemoteCategoryEvent
{
  const RemoteCategoryEvent();
}
class GetCategoryProductEvent extends RemoteCategoryEvent
{
  final String name;
  const GetCategoryProductEvent(this.name);
}