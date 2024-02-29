import 'package:bloc/bloc.dart';
import 'package:flutter_blue/flutter_blue.dart';
import 'package:meta/meta.dart';

part 'bluetooth_state.dart';

class BluetoothCubit extends Cubit<BluetoothState> {
  late List<String> devices;
  late String dropdownValue;
  final FlutterBlue flutterBlue = FlutterBlue.instance;
  
  BluetoothCubit() : super(BluetoothInitial()){
    devices = ["Select device"];
    dropdownValue = devices.first;
  }

  void changeValue(String value){
    dropdownValue = value;
    emit(DoneState());
  }

  void scan() async{
    emit(LoadingState());
    var x = await flutterBlue.startScan(timeout: const Duration(seconds: 3));
    flutterBlue.stopScan();
    print(x);
    flutterBlue.scanResults.listen((list) { 
      for(var device in list){
        if(!devices.contains(device.device.name) && device.device.name != ""){
          devices.add(device.device.name);
        }
      }
    });
    emit(DoneState());
  }
}
