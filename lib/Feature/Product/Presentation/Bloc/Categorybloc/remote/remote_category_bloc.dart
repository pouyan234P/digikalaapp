

import 'package:digikalaapp/Core/Resourses/data_state.dart';
import 'package:digikalaapp/Feature/Product/Domain/Entity/ProductEntity.dart';
import 'package:digikalaapp/Feature/Product/Presentation/Bloc/Categorybloc/remote/remote_category_event.dart';
import 'package:digikalaapp/Feature/Product/Presentation/Bloc/Categorybloc/remote/remote_category_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../Domain/Usecase/get_CategorySearch.dart';

class RemoteCategoryBloc extends Bloc<RemoteCategoryEvent,RemoteCategoryState> {
  final GetCategorySearchUseCase _getCategorySearchUseCase;

  RemoteCategoryBloc(this._getCategorySearchUseCase): super( RemoteCategoryInitial())
  {
    on <GetCategoryProductEvent>(onGetCategorySearch);
  }

  void onGetCategorySearch(GetCategoryProductEvent event,Emitter<RemoteCategoryState> emit) async
  {
    final dataState=await _getCategorySearchUseCase.callcategory(event.name);
    if(dataState is DataSuccess && dataState.data!.isNotEmpty)
      {
        emit(
          RemoteCategoryDone(dataState.data!)
        );
      }
    if(dataState is DataFailed)
      {
        emit(
          RemoteCategoryError(dataState.error!)
        );
      }
  }
}