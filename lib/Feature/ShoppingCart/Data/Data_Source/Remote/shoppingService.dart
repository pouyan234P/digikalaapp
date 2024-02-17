import 'package:digikalaapp/Feature/ShoppingCart/Data/Model/CartDetailDTO.dart';
import 'package:digikalaapp/Feature/ShoppingCart/Data/Model/cartDetailShoppingModel.dart';
import 'package:dio/dio.dart';
import 'package:digikalaapp/Core/Constants/Constants.dart';
import 'package:retrofit/retrofit.dart';

part 'shoppingService.g.dart';

@RestApi(baseUrl: ShoppingUrl)
abstract class shoppingService
{
  factory shoppingService(Dio dio)=_shoppingService;

  @GET('/GetAllShoppingcart/{userid}')
  Future<HttpResponse<List<cartDetailShoppingModel>>> GetAllShoppingcart(@Path('userid') int ? userid,@Query('PageNumber') int ? PageNumber,@Header('Authorization')String token);
  @POST('/Addcart')
  Future<HttpResponse> Addcart(@Body() CartDetailDTO  mycartDetailShoppingModel,@Header('Authorization')String token);
  @POST('/DeleteShoppingcart/{detailid}')
  Future<HttpResponse> deleteShoppingcart(@Path('detailid') int ? detailid,@Header('Authorization')String token);
}