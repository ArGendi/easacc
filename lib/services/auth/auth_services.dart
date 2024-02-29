import 'package:easacc/models/status.dart';

abstract class AuthServices{
  Future<Status> login();
}