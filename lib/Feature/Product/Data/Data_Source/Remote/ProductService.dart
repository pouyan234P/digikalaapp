import 'package:digikalaapp/Core/Constants/Constants.dart';
import 'package:digikalaapp/Feature/Product/Data/Model/ProductModel.dart';
import 'package:retrofit/retrofit.dart';
import 'package:dio/dio.dart';
part 'ProductService.g.dart';


@RestApi(baseUrl: ProductUrl)
abstract class ProductService
{
  factory ProductService(Dio dio)=_ProductService;

  @GET('/Getbyserch/{name}')
  Future<HttpResponse<List<ProductModel>>> getProductbyCategory(@Path('name') String ? name);
}