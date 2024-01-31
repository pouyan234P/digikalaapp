

abstract class RemoteCategoryEvent
{
  const RemoteCategoryEvent();
}
class GetCategoryProductEvent extends RemoteCategoryEvent
{
  final String name;
  final int PageNumber;
  const GetCategoryProductEvent(this.name,this.PageNumber);
}
class GetSingleProductEvent extends RemoteCategoryEvent
{
  final int id;

  const GetSingleProductEvent(this.id);
}