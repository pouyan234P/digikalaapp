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
  Future<HttpResponse<List<cartDetailShoppingModel>>> GetAllShoppingcart(@Path('userid') int ? userid);
}