

import 'package:digikalaapp/Core/Resourses/data_state.dart';
import 'package:digikalaapp/Feature/ShoppingCart/Domain/Usecase/get_shoppingCart.dart';
import 'package:digikalaapp/Feature/ShoppingCart/Presentation/Bloc/remote/remote_shopping_Event.dart';
import 'package:digikalaapp/Feature/ShoppingCart/Presentation/Bloc/remote/remote_shopping_State.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class RemoteShoppingBloc extends Bloc<RemoteShoppingEvent,RemoteShoppingState>
{
  final GetShoppingCartUseCase _cartUseCase;
  RemoteShoppingBloc(this._cartUseCase):super(RemoteShoppingLoading())
  {
    on<GetShoppingEvent>(onGetShoppingcart);
  }
  RemoteShoppingBloc.Add(this._cartUseCase):super(RemoteAddShoppingLoading())
  {
    on<getAddShoppingEvent>(onGetAddShoppingcart);
  }
  void onGetShoppingcart(GetShoppingEvent event,Emitter<RemoteShoppingState> emit) async
  {
    final dataState=await _cartUseCase.callShoppingcart(event.userid,event.PageNumber);
    if(dataState is DataSuccess && dataState.data!.isNotEmpty)
      {
        emit(
          RemoteShoppingDone(dataState.data!)
        );
      }
    if(dataState is DataFailed)
    {
      emit(
          RemoteShoppingError(dataState.error!)
      );
    }
  }
  void onGetAddShoppingcart(getAddShoppingEvent event,Emitter<RemoteShoppingState> emit) async
  {
    final datastate=await _cartUseCase.Addcart(event.cartdetail);
    if(datastate is DataSuccess)
      {
        emit(
          RemoteAddShoppingDone()
        );
      }
    if(datastate is DataFailed)
      {
        emit(
          RemoteAddShoppingError(datastate.error!)
        );
      }
  }
}