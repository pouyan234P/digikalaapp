

import 'package:digikalaapp/Core/Resourses/data_state.dart';
import 'package:digikalaapp/Feature/Login/Domain/Usecase/get_register_usecase.dart';
import 'package:digikalaapp/Feature/Login/Presentation/Bloc/Remote/remote_register_event.dart';
import 'package:digikalaapp/Feature/Login/Presentation/Bloc/Remote/remote_register_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class remoteRegisterBloc extends Bloc<remoteRegisterEvent,remoteRegisterState>
{
  final getRegisterUsecase _registerUsecase;
  remoteRegisterBloc(this._registerUsecase): super(remoteRegisterLoading()){
    on<getRemoteRegisterEvent>(onGetRegister);
  }
  void onGetRegister(getRemoteRegisterEvent event,Emitter<remoteRegisterState> emit) async
  {
    final datestate=await this._registerUsecase.Register(event.registerEntity);
    if(datestate is DataSuccess)
      {
        emit(
          remoteRegisterDone()
        );
      }
    if(datestate is DataFailed)
      {
        emit(
          remoteRegisterError(datestate.error!)
        );
      }
  }
}