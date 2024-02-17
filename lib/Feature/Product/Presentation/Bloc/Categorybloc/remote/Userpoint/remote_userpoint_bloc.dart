

import 'package:digikalaapp/Core/Resourses/data_state.dart';
import 'package:digikalaapp/Feature/Product/Presentation/Bloc/Categorybloc/remote/Userpoint/remote_userpoint_event.dart';
import 'package:digikalaapp/Feature/Product/Presentation/Bloc/Categorybloc/remote/Userpoint/remote_userpoint_state.dart';
import 'package:digikalaapp/Feature/Product/Presentation/Bloc/Categorybloc/remote/remote_category_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../../../Domain/Usecase/Userpoint/get_Userpoint.dart';

class RemoteUserpointBloc extends Bloc<RemoteuserpointEvent,RemoteUserpointState>
{
  final GetUserpointUsecase _getUserpointUsecase;
  RemoteUserpointBloc(this._getUserpointUsecase):super( RemoteUserpointloading()){
    on <GetRemoteuserpointEvent>(onGetUserpoint);
  }
  RemoteUserpointBloc.Add(this._getUserpointUsecase):super(RemoteUserpointAddLoading())
  {
    on<GetRemoteuserpointAddEvent>(onGetAddUserpoint);
  }

  void onGetUserpoint(GetRemoteuserpointEvent event,Emitter<RemoteUserpointState> emit) async
  {
    final datastate=await _getUserpointUsecase.callUserpoint(event.id);
    if(datastate is DataSuccess && datastate.data!.isNotEmpty)
      {
        emit
          (
          RemoteUserpointDone(datastate.data!)
        );
      }
    if(datastate is DataFailed)
      {
        emit(
          RemoteUserpointError(datastate.error!)
        );
      }
  }
  void onGetAddUserpoint(GetRemoteuserpointAddEvent event,Emitter<RemoteUserpointState> emit) async
  {
    final datastate=await _getUserpointUsecase.adduserpoint(event.userpointEntity);
    if(datastate is DataSuccess)
      {
        emit(
          RemoteUserpointAddDone()
        );
      }
    if(datastate is DataFailed)
      {
        emit(
          RemoteUserpointAddError(datastate.error!)
        );
      }
  }
}