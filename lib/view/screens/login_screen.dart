import 'package:easacc/cubits/auth/auth_cubit.dart';
import 'package:easacc/enums.dart';
import 'package:easacc/services/auth/facebook_services.dart';
import 'package:easacc/services/auth/google_services.dart';
import 'package:easacc/view/widgets/custom_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_facebook_auth/flutter_facebook_auth.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    var authCubit = BlocProvider.of<AuthCubit>(context);
    return Scaffold(
      appBar: AppBar(
        title: const Text('Login'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: BlocBuilder<AuthCubit, AuthState>(
          builder: (context, state) {
            if(state is LoadingState){
              return const Center(child: CircularProgressIndicator());
            }
            else{
               return Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  CustomButton(
                    text: "Google",
                    onPressed: () {
                      authCubit.login(context, GoogleServices());
                    },
                    bgColor: Colors.red.shade400,
                    icon: const FaIcon(FontAwesomeIcons.google),
                  ),
                  const SizedBox(
                    height: 15,
                  ),
                  CustomButton(
                    text: "Facebook",
                    onPressed: () async {
                      authCubit.login(context, FacebookServices());
                    },
                    bgColor: Colors.blue.shade900,
                    icon: const FaIcon(FontAwesomeIcons.facebook),
                  ),
                ],
              );
            }
          },
        ),
      ),
    );
  }
}
