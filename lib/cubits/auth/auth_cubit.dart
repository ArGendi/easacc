import 'package:bloc/bloc.dart';
import 'package:easacc/enums.dart';
import 'package:easacc/services/auth/auth_services.dart';
import 'package:easacc/services/auth/facebook_services.dart';
import 'package:easacc/services/auth/google_services.dart';
import 'package:easacc/view/screens/setting_screen.dart';
import 'package:flutter/material.dart';
import 'package:meta/meta.dart';

part 'auth_state.dart';

class AuthCubit extends Cubit<AuthState> {
  AuthCubit() : super(AuthInitial());

  void login(BuildContext context, AuthServices provider) async{
    AuthServices authServices = provider;
    emit(LoadingState());
    authServices.login().then((value){
      if(value.type == StatusType.success){
        emit(SuccessState());
        Navigator.push(context, MaterialPageRoute(builder: (context) => const SettingScreen()));
      }
      else{
        emit(FailState());
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text(value.data.toString()), backgroundColor: Colors.red,),
        );
      }
    });
  }
}
