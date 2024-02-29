import 'package:easacc/enums.dart';

class Status<T>{
  T data;
  StatusType type;

  Status(this.data, this.type);
}