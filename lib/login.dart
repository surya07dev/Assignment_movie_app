// ignore_for_file: unrelated_type_equality_checks

import 'package:demo/cubit/demo_cubit.dart';
import 'package:demo/home.dart';
import 'package:demo/local_storage.dart';
import 'package:demo/registration.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class Login extends StatelessWidget {
  Login({super.key});

  final TextEditingController nameCtrl = TextEditingController();
  final TextEditingController pwdCtrl = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => FocusManager.instance.primaryFocus?.unfocus(),
      child: Scaffold(body: SizedBox.expand(
        child: BlocBuilder<DemoCubit, DemoState>(
          builder: (context, state) {
            var cubit = context.read<DemoCubit>();
            cubit.initialState();
            return Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Form(
                  key: key,
                  child: Padding(
                    padding: const EdgeInsets.symmetric(
                        vertical: 15, horizontal: 20),
                    child: TextFormField(
                      style: const TextStyle(fontSize: 15),
                      controller: nameCtrl,
                      decoration: InputDecoration(
                        label: const Text("Name"),
                        filled: true,
                        fillColor: Colors.white,
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10.0)),
                        contentPadding: const EdgeInsets.symmetric(
                          vertical: 0,
                          horizontal: 10,
                        ),
                      ),
                    ),
                  ),
                ),
                Padding(
                  padding:
                      const EdgeInsets.symmetric(vertical: 15, horizontal: 20),
                  child: TextFormField(
                    obscureText: state.isObsecure!,
                    controller: pwdCtrl,
                    style: const TextStyle(fontSize: 15),
                    decoration: InputDecoration(
                      suffixIcon: GestureDetector(
                        child: Icon(state.isObsecure!
                            ? Icons.visibility_off
                            : Icons.visibility),
                        onTap: () {
                          cubit.isObsecure();
                        },
                      ),
                      label: const Text("Password"),
                      filled: true,
                      fillColor: Colors.white,
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10.0)),
                      contentPadding: const EdgeInsets.symmetric(
                        vertical: 0,
                        horizontal: 10,
                      ),
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 20),
                  child: GestureDetector(
                    onTap: () {
                      Navigator.pushReplacement(
                          context,
                          MaterialPageRoute(
                              builder: (context) => const Registration()));
                    },
                    child: const Text(
                      "Register",
                      style: TextStyle(color: Colors.blue),
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 30, left: 40, right: 40),
                  child: state.isLoading
                      ? const CircularProgressIndicator()
                      : SizedBox(
                          width: double.infinity,
                          child: MaterialButton(
                            color: Colors.blue,
                            onPressed: () async {
                              if (nameCtrl.text != state.name ||
                                  pwdCtrl.text != state.pwd) {
                                ScaffoldMessenger.of(context)
                                    .removeCurrentSnackBar(
                                        reason: SnackBarClosedReason.action);
                                ScaffoldMessenger.of(context)
                                    .showSnackBar(const SnackBar(
                                  backgroundColor: Colors.red,
                                  content: Text(
                                    "Invallid Credentials",
                                    style:
                                        TextStyle(fontWeight: FontWeight.bold),
                                    textAlign: TextAlign.center,
                                  ),
                                ));
                              } else {
                                bool res = await cubit.request();
                                if (res) {
                                  Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                          builder: (context) => const Home()));
                                }
                              }
                            },
                            child: const Text(
                              "Login",
                              style:
                                  TextStyle(color: Colors.white, fontSize: 20),
                            ),
                          ),
                        ),
                ),
              ],
            );
          },
        ),
      )),
    );
  }
}
