import 'package:easacc/cubits/auth/auth_cubit.dart';
import 'package:easacc/cubits/bluetooth/bluetooth_cubit.dart';
import 'package:easacc/view/screens/login_screen.dart';
import 'package:easacc/view/screens/setting_screen.dart';
import 'package:easacc/view/screens/webview_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

void main() async{
  WidgetsFlutterBinding.ensureInitialized();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (context) => AuthCubit()),
        BlocProvider(create: (context) => BluetoothCubit()),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Easacc test',
        theme: ThemeData(
          colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
          useMaterial3: true,
          appBarTheme: const AppBarTheme(
            backgroundColor: Colors.black,
            foregroundColor: Colors.white,
            centerTitle: true,
          )
        ),
        home: const LoginScreen(),
      ),
    );
  }
}

