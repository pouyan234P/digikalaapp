

import 'package:digikalaapp/Core/Resourses/data_state.dart';
import 'package:digikalaapp/Feature/Login/Domain/Usecase/get_login_usecase.dart';
import 'package:digikalaapp/Feature/Login/Domain/Usecase/get_register_usecase.dart';
import 'package:digikalaapp/Feature/Login/Presentation/Bloc/Remote/Login/remote_login_event.dart';
import 'package:digikalaapp/Feature/Login/Presentation/Bloc/Remote/Login/remote_login_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class remoteLoginBloc extends Bloc<remoteLoginEvent,remoteLoginState>
{
  final getLoginUsecase _loginUsecase;
  remoteLoginBloc(this._loginUsecase):super(remoteLoginLoading())
  {
    on<getRemoteLoginEvent>(onGetLogin);
  }
  void onGetLogin(getRemoteLoginEvent event,Emitter<remoteLoginState> emit) async
  {
    final datastate=await this._loginUsecase.Login(event.loginEntity);
    if(datastate is DataSuccess)
      {
        emit(
          remoteLoginDone(datastate.data!)
        );
      }
    if(datastate is DataFailed)
      {
        emit(
          remoteLoginError(datastate.error!)
        );
      }
  }
}