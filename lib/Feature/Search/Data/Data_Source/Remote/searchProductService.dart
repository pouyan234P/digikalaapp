
import 'package:digikalaapp/Feature/Search/Data/Model/searchProductModel.dart';
import 'package:dio/dio.dart';
import 'package:retrofit/retrofit.dart';
import '../../../../../Core/Constants/Constants.dart';
part 'searchProductService.g.dart';


@RestApi(baseUrl: ProductUrl)
abstract class searchProductService
{
  factory searchProductService(Dio dio)=_searchProductService;
  @GET('/Getbyserch/{name}')
  Future<HttpResponse<List<searchProductModel>>> getProductbyCategory(@Path('name') String ? name);
}