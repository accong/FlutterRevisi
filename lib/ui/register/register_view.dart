import 'package:flutter/material.dart';
import 'package:tripkuy/core/app/app.dart';
import 'package:tripkuy/core/util/util.dart';

import '../component.dart';

class Register extends StatelessWidget {
  Register({Key? key}) : super(key: key);

  final GlobalKey<FormState> formKey = GlobalKey<FormState>();

  final TextEditingController usernameController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordConfirmController =
      TextEditingController();

  onRegister() {
    if (formKey.currentState!.validate()) {
      CoreFunction.showToast("Berhasil Regist",
          backgroundColor: ColorPalette.white);
      // routePush(const HomeView(), RouterType.material);
    } else {
      CoreFunction.showToast("Uknown Action");
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorPalette.white,
      body: Padding(
        padding: Constant.paddingScreen,
        child: Form(
          key: formKey,
          child: Center(
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Component.textBold("Register",
                    fontSize: 17, colors: ColorPalette.black),
                SizedBox(
                  height: SizeConfig.blockSizeVertical * 8,
                ),
                TextFormField(
                  keyboardType: TextInputType.text,
                  textInputAction: TextInputAction.next,
                  controller: usernameController,
                  style: const TextStyle(fontSize: 14, color: Colors.black),
                  decoration: Component.decorationNoBorder("Username",
                      iconPrefix: Icons.email),
                  validator: (value) {
                    if (value!.isEmpty) {
                      return 'masukkan username';
                    }
                    if (value.length < 8) {
                      return 'data tidak lengkap';
                    }
                    return null;
                  },
                ),
                const SizedBox(
                  height: 20,
                ),
                TextFormField(
                  keyboardType: TextInputType.text,
                  textInputAction: TextInputAction.next,
                  controller: emailController,
                  style: const TextStyle(fontSize: 14, color: Colors.black),
                  decoration: Component.decorationNoBorder("Email",
                      iconPrefix: Icons.email),
                  validator: (value) {
                    if (value!.isEmpty) {
                      return 'masukkan email';
                    }
                    if (value.length < 8) {
                      return 'data tidak lengkap';
                    }
                    return null;
                  },
                ),
                const SizedBox(
                  height: 20,
                ),
                TextFormField(
                  keyboardType: TextInputType.number,
                  textInputAction: TextInputAction.done,
                  controller: passwordController,
                  style: const TextStyle(fontSize: 14, color: Colors.black),
                  decoration: Component.decorationNoBorder("Phone Number",
                      iconPrefix: Icons.lock),
                  validator: (value) {
                    if (value!.isEmpty) {
                      return 'masukan phone number';
                    }
                    if (value.length < 8) {
                      return 'password kurang dari 8 karakter';
                    }
                    return null;
                  },
                ),
                const SizedBox(
                  height: 20,
                ),
                TextFormField(
                  obscureText: true,
                  keyboardType: TextInputType.text,
                  textInputAction: TextInputAction.done,
                  controller: passwordConfirmController,
                  style: const TextStyle(fontSize: 14, color: Colors.black),
                  decoration: Component.decorationNoBorder("Password",
                      iconPrefix: Icons.lock),
                  validator: (value) {
                    if (value!.isEmpty) {
                      return 'masukan password';
                    }
                    if (value.length < 8) {
                      return 'please fill';
                    }
                    return null;
                  },
                ),
                const SizedBox(
                  height: 20,
                ),
                Component.button(
                    label: "Register",
                    onPressed: () {
                      onRegister();
                    }),
                const SizedBox(
                  height: 15,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Component.textDefault("Already have an account ? "),
                    InkWell(
                        onTap: () {
                          Navigator.of(context).pop();
                        },
                        child: Component.textBold("Sign In",
                            colors: ColorPalette.blue)),
                  ],
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
