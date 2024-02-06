

import 'dart:io';

import 'package:digikalaapp/Feature/ShoppingCart/Data/Model/CartDetailDTO.dart';
import 'package:digikalaapp/Feature/ShoppingCart/Data/Model/CartHeaderDTO.dart';
import 'package:digikalaapp/Feature/ShoppingCart/Data/Model/cartHeaderShoppingModel.dart';
import 'package:digikalaapp/Feature/ShoppingCart/Data/Model/ProductDTO.dart';
import 'package:digikalaapp/Feature/ShoppingCart/Data/Model/productShoppingModel.dart';
import 'package:digikalaapp/Feature/ShoppingCart/Domain/Entity/cartAddDetailShoppingEntity.dart';
import 'package:digikalaapp/Feature/ShoppingCart/Domain/Entity/cartDetailShoppingEntity.dart';
import 'package:dio/dio.dart';
import 'package:digikalaapp/Core/Resourses/data_state.dart';
import 'package:digikalaapp/Feature/ShoppingCart/Data/Data_Source/Remote/shoppingService.dart';
import 'package:digikalaapp/Feature/ShoppingCart/Data/Model/cartDetailShoppingModel.dart';
import 'package:digikalaapp/Feature/ShoppingCart/Domain/Repository/shoppingRepository.dart';

class shoppingRepositoryImpl extends shoppingRepository
{
  final shoppingService _service;
  shoppingRepositoryImpl(this._service);
  @override
  Future<DataState<List<cartDetailShoppingModel>>> GetAllShoppingcart(int ? userid,int ? PageNumber) async {
    try
        {
          final httpResponse=await _service.GetAllShoppingcart(userid,PageNumber);
          if(httpResponse.response.statusCode==HttpStatus.ok)
            {
              return DataSuccess(httpResponse.data);
            }
          else
            {
              return DataFailed(
                  DioException(
                      error: httpResponse.response.statusMessage,
                      response: httpResponse.response,
                      type: DioExceptionType.badResponse,
                      requestOptions: httpResponse.response.requestOptions
                  )
              );
            }

        } on DioException catch(e)
    {
    return DataFailed(e);
    }
  }

  @override
  Future<DataState> Addcart(cartAddDetailShoppingEntity? mycartDetailShoppingEntity) async{
    // TODO: implement Addcart
   try
       {

         final httpResponse=await _service.Addcart(CartDetailDTO(productid:
         ProductDTO(productid: mycartDetailShoppingEntity!.productid!.productid!,Price: mycartDetailShoppingEntity!.productid!.Price!,Color: mycartDetailShoppingEntity!.productid!.Color!,Picture: mycartDetailShoppingEntity!.productid!.Picture!,Name: mycartDetailShoppingEntity!.productid!.Name!),
             headerid: CartHeaderDTO(userid: mycartDetailShoppingEntity!.Headerid!.Userid!),
             Count: mycartDetailShoppingEntity!.Count!));
         if(httpResponse.response.statusCode==HttpStatus.ok)
           {
             return DataSuccess(httpResponse.data!);
           }
         else
         {
           return DataFailed(
               DioException(
                   error: httpResponse.response.statusMessage,
                   response: httpResponse.response,
                   type: DioExceptionType.badResponse,
                   requestOptions: httpResponse.response.requestOptions
               )
           );
         }

       }on DioException catch(e)
   {

     return DataFailed(e);
   }
  }

}