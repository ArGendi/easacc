import 'package:easacc/enums.dart';
import 'package:easacc/models/status.dart';
import 'package:easacc/services/auth/auth_services.dart';
import 'package:flutter_facebook_auth/flutter_facebook_auth.dart';

class FacebookServices extends AuthServices{
  @override
  Future< Status<String> > login() async{
    final LoginResult result = await FacebookAuth.instance.login();
    if (result.status == LoginStatus.success) {
      AccessToken accessToken = result.accessToken!;
      return Status(accessToken.userId, StatusType.success);
    } else {
      return Status(result.message ?? "Try again later", StatusType.fail);
    }
  }
}