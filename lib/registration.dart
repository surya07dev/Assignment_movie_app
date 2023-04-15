import 'package:demo/cubit/demo_cubit.dart';
import 'package:demo/local_storage.dart';
import 'package:demo/login.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class Registration extends StatelessWidget {
  const Registration({super.key});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => FocusManager.instance.primaryFocus?.unfocus(),
      child: Scaffold(body: SizedBox.expand(
        child: BlocBuilder<DemoCubit, DemoState>(
          builder: (context, state) {
            var cubit = context.read<DemoCubit>();
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
                      onChanged: cubit.name,
                    ),
                  ),
                ),
                Padding(
                  padding:
                      const EdgeInsets.symmetric(vertical: 15, horizontal: 20),
                  child: TextFormField(
                    style: const TextStyle(fontSize: 15),
                    decoration: InputDecoration(
                      label: const Text("Email"),
                      filled: true,
                      fillColor: Colors.white,
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10.0)),
                      contentPadding: const EdgeInsets.symmetric(
                        vertical: 0,
                        horizontal: 10,
                      ),
                    ),
                    onChanged: cubit.email,
                  ),
                ),
                Padding(
                  padding:
                      const EdgeInsets.symmetric(vertical: 15, horizontal: 20),
                  child: TextFormField(
                    obscureText: state.isObsecure!,
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
                    onChanged: cubit.pwd,
                  ),
                ),
                Padding(
                  padding:
                      const EdgeInsets.symmetric(vertical: 15, horizontal: 20),
                  child: TextFormField(
                    keyboardType: TextInputType.phone,
                    style: const TextStyle(fontSize: 15),
                    decoration: InputDecoration(
                      label: const Text("Contact"),
                      filled: true,
                      fillColor: Colors.white,
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10.0)),
                      contentPadding: const EdgeInsets.symmetric(
                        vertical: 0,
                        horizontal: 10,
                      ),
                    ),
                    onChanged: cubit.contact,
                  ),
                ),
                Padding(
                  padding:
                      const EdgeInsets.symmetric(vertical: 15, horizontal: 20),
                  child: DropdownButtonFormField(
                    value: state.profession,
                    icon: const Icon(Icons.keyboard_arrow_down),
                    items: dropdownItems,
                    onChanged: cubit.profession,
                    style: const TextStyle(fontSize: 15),
                    decoration: InputDecoration(
                      label: const Text("Professional"),
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
                  padding: const EdgeInsets.only(top: 30, left: 40, right: 40),
                  child: SizedBox(
                    width: double.infinity,
                    child: MaterialButton(
                      color: Colors.blue,
                      onPressed: () {
                        if (state.contact == "" ||
                            state.name == "" ||
                            state.email == "" ||
                            state.profession == "Please enter" ||
                            state.pwd == "") {
                          ScaffoldMessenger.of(context).removeCurrentSnackBar(
                              reason: SnackBarClosedReason.action);
                          ScaffoldMessenger.of(context)
                              .showSnackBar(const SnackBar(
                            backgroundColor: Colors.red,
                            content: Text(
                              "All the above fields are required",
                              style: TextStyle(fontWeight: FontWeight.bold),
                              textAlign: TextAlign.center,
                            ),
                          ));
                        } else {
                          cubit.saveCreds();
                          Navigator.push(context,
                              MaterialPageRoute(builder: (context) => Login()));
                        }
                      },
                      child: const Text(
                        "Register",
                        style: TextStyle(color: Colors.white, fontSize: 20),
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

  List<DropdownMenuItem<String>> get dropdownItems {
    List<DropdownMenuItem<String>> menuItems = const [
      DropdownMenuItem(
          enabled: false,
          value: "Please enter",
          child: Text(
            "Please enter",
            style: TextStyle(color: Colors.black),
          )),
      DropdownMenuItem(
          value: "Frontend",
          child: Text(
            "Frontend",
            style: TextStyle(color: Colors.black),
          )),
      DropdownMenuItem(
          value: "Backend",
          child: Text(
            "Backend",
            style: TextStyle(color: Colors.black),
          )),
      DropdownMenuItem(
          value: "Mobile",
          child: Text(
            "Mobile",
            style: TextStyle(color: Colors.black),
          )),
      DropdownMenuItem(
          value: "QA",
          child: Text(
            "QA",
            style: TextStyle(color: Colors.black),
          )),
      DropdownMenuItem(
          value: "Networking",
          child: Text(
            "Networking",
            style: TextStyle(color: Colors.black),
          )),
      DropdownMenuItem(
          value: "Cyber security",
          child: Text(
            "Cyber security",
            style: TextStyle(color: Colors.black),
          )),
    ];
    return menuItems;
  }
}
