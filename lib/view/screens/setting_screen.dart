import 'package:easacc/cubits/bluetooth/bluetooth_cubit.dart';
import 'package:easacc/view/screens/webview_screen.dart';
import 'package:easacc/view/widgets/custom_button.dart';
import 'package:easacc/view/widgets/custom_dropdown.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class SettingScreen extends StatefulWidget {
  const SettingScreen({super.key});

  @override
  State<SettingScreen> createState() => _SettingScreenState();
}

class _SettingScreenState extends State<SettingScreen> {
  String? url;
  GlobalKey<FormState> formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    var btCubit = BlocProvider.of<BluetoothCubit>(context);
    return Scaffold(
      appBar: AppBar(
        title: const Text('Setting'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Form(
              key: formKey,
              child: TextFormField(
                onSaved: (value) {
                  url = value;
                },
                validator: (value) {
                  if (value!.isEmpty) {
                    return "Enter Your URL";
                  } else if (!value.startsWith("http")) {
                    return "Enter valid URL (starts with http://)";
                  } else {
                    return null;
                  }
                },
                keyboardType: TextInputType.url,
                decoration: InputDecoration(
                  labelText: "Your URL",
                  prefixIcon: const Icon(Icons.link),
                  enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(8),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(8),
                  ),
                  errorBorder: OutlineInputBorder(
                    borderSide: const BorderSide(color: Colors.red),
                    borderRadius: BorderRadius.circular(8),
                  ),
                  focusedErrorBorder: OutlineInputBorder(
                    borderSide: const BorderSide(color: Colors.red),
                    borderRadius: BorderRadius.circular(8),
                  ),
                ),
              ),
            ),
            const SizedBox(
              height: 10,
            ),
            CustomButton(
              text: "Go Now",
              onPressed: () {
                bool valid = formKey.currentState?.validate() ?? false;
                if (valid) {
                  formKey.currentState?.save();
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => WebViewScreen(url: url!)));
                }
              },
            ),
            const SizedBox(
              height: 40,
            ),
            BlocBuilder<BluetoothCubit, BluetoothState>(
              builder: (context, state) {
                return CustomDropdown(
                  dropdownValue: btCubit.dropdownValue,
                  onChanged: btCubit.changeValue,
                  values: btCubit.devices,
                );
              },
            ),
            const SizedBox(
              height: 5,
            ),
            BlocBuilder<BluetoothCubit, BluetoothState>(
              builder: (context, state) {
                if (state is LoadingState) {
                  return const Center(
                    child: CircularProgressIndicator(
                      color: Colors.black,
                    ),
                  );
                } else {
                  return CustomButton(
                    text: "Scan",
                    onPressed: () async {
                      btCubit.scan();
                    },
                  );
                }
              },
            )
          ],
        ),
      ),
    );
  }
}
