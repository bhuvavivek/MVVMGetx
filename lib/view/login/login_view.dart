import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mvvmwithget/utils/utils.dart';
import 'package:mvvmwithget/view_model/controllers/login/login_controllers.dart';

class LoginView extends StatefulWidget {
  const LoginView({super.key});

  @override
  State<LoginView> createState() => _LoginViewState();
}

class _LoginViewState extends State<LoginView> {
  final controller = Get.put(LoginControllers());
  final _formkey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(title: const Text("Login")),
        body: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Form(
            key: _formkey,
            child: Column(
              children: [
                TextFormField(
                    key: const ValueKey('email'),
                    controller: controller.email.value,
                    focusNode: controller.emailnode.value,
                    validator: (value) {
                      if (value!.isEmpty) {
                        // Utils.snackBar("Email", "Email is empty");
                        return "Email is empty";
                      }
                      return null;
                    },
                    onFieldSubmitted: (value) {
                      Utils.fieldFocusChange(
                          context,
                          controller.emailnode.value,
                          controller.passwordnode.value);
                    },
                    enabled: true,
                    decoration: const InputDecoration(
                      labelText: "EMail",
                      hintText: "please enter your email",
                      border: OutlineInputBorder(
                          borderSide: BorderSide(color: Colors.black12)),
                      disabledBorder: OutlineInputBorder(
                          borderSide: BorderSide(color: Colors.yellow)),
                      errorBorder: OutlineInputBorder(
                          borderSide: BorderSide(color: Colors.brown)),
                      focusedBorder: OutlineInputBorder(
                          borderSide: BorderSide(color: Colors.pink)),
                    )),
                Container(
                  height: 10,
                ),
                TextFormField(
                    key: const ValueKey('password'),
                    controller: controller.password.value,
                    focusNode: controller.passwordnode.value,
                    obscureText: true,
                    validator: (value) {
                      if (value!.isEmpty) {
                        // Utils.snackBar("Password", "Password is empty");
                        return "Password is empty";
                      }
                      return null;
                    },
                    enabled: true,
                    decoration: const InputDecoration(
                      labelText: "Password",
                      hintText: "please enter your Password",
                      border: OutlineInputBorder(
                          borderSide: BorderSide(color: Colors.black12)),
                      disabledBorder: OutlineInputBorder(
                          borderSide: BorderSide(color: Colors.yellow)),
                      errorBorder: OutlineInputBorder(
                          borderSide: BorderSide(color: Colors.brown)),
                      focusedBorder: OutlineInputBorder(
                          borderSide: BorderSide(color: Colors.pink)),
                    )),
                Container(
                  height: 10,
                ),
                ElevatedButton(
                    onPressed: () {
                      if (_formkey.currentState!.validate()) {
                        controller.loginApi();
                      }
                    },
                    child: const Text("Submit"))
              ],
            ),
          ),
        ));
  }
}
