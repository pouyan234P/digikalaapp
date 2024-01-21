

import 'package:digikalaapp/Core/Resourses/data_state.dart';
import 'package:digikalaapp/Feature/Search/Domain/Usecase/get_searchProduct.dart';
import 'package:digikalaapp/Feature/Search/Presentation/Bloc/remote/Remote_searchProduct_Event.dart';
import 'package:digikalaapp/Feature/Search/Presentation/Bloc/remote/Remote_searchProduct_State.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class RemotesearchProductBloc extends Bloc<RemotesearchProductEvent,RemotesearchProductState>
{
   GetsearchProductUseCase _getsearchProductUseCase;
  RemotesearchProductBloc(this._getsearchProductUseCase):super(RemotesearchProductInitial())
  {
    on<GetsearchProductEvent>(onsearch);
  }
  void onsearch(GetsearchProductEvent event,Emitter<RemotesearchProductState> emitter) async
  {
     var datastate=await _getsearchProductUseCase.searchProduct(event.name);
    if(datastate is DataSuccess && datastate.data!.isNotEmpty)
      {

        emit(
          RemotesearchProductDone(datastate.data!)
        );
      }
    if(datastate is DataFailed)
      {
        emit(
          RemotesearchProductError(datastate.error!)
        );
      }
  }
}