import 'dart:io';

import 'package:easacc/enums.dart';
import 'package:easacc/models/status.dart';
import 'package:easacc/services/auth/auth_services.dart';
import 'package:google_sign_in/google_sign_in.dart';

class GoogleServices extends AuthServices{
  @override
  Future< Status<String?> > login() async{
    try{
      GoogleSignInAccount? googleUser = await GoogleSignIn(
        clientId: Platform.isIOS || Platform.isMacOS ? 
          "841846307165-iuvdjsje71bq160vnrh1cie997jfld57.apps.googleusercontent.com" : null,
        scopes: ["email"]
      ).signIn();
      return Status(googleUser?.email, StatusType.success);
    }
    catch(e){
      return Status(e.toString(), StatusType.fail);
    }
  }
}