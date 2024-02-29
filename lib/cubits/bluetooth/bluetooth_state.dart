part of 'bluetooth_cubit.dart';

@immutable
abstract class BluetoothState {}

class BluetoothInitial extends BluetoothState {}
class LoadingState extends BluetoothState {}
class DoneState extends BluetoothState {}


