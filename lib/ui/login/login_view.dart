import 'package:flutter/material.dart';
import 'package:tripkuy/core/app/app.dart';
import 'package:tripkuy/core/util/util.dart';
import 'package:tripkuy/ui/component.dart';
import 'package:tripkuy/ui/dashboard/view/dashboard.dart';
import 'package:tripkuy/ui/register/register_view.dart';

class LoginView extends StatelessWidget {
  LoginView({Key? key}) : super(key: key);

  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

  onLogin() {
    if (emailController.text.isEmpty || passwordController.text.isEmpty) {
      CoreFunction.showToast("Please fill Email & Password");
    } else if (emailController.text != Constant.adminEmail) {
      CoreFunction.showToast("Wrong Email");
    } else if (passwordController.text != Constant.adminPassword) {
      CoreFunction.showToast("Wrong Password");
    } else if (emailController.text == Constant.adminEmail &&
        passwordController.text == Constant.adminPassword) {
      pushAndRemoveUntil(Dashboard(), RouterType.material);
    } else {
      CoreFunction.showToast("Unknown Action");
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorPalette.white,
      body: Stack(
        children: [
          Container(
            width: SizeConfig.blockSizeHorizontal * 50,
            height: SizeConfig.blockSizeHorizontal * 40,
            decoration: const BoxDecoration(
              image: DecorationImage(
                image: AssetImage(
                  "assets/images/background.png",
                ),
                fit: BoxFit.cover,
              ),
            ),
          ),
          Padding(
            padding: Constant.paddingScreen,
            child: Center(
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Component.textBold("Welcome Back!",
                      fontSize: 16, colors: ColorPalette.black),
                  const SizedBox(
                    height: 20,
                  ),
                  Image.asset(
                    "assets/images/image_login.png",
                    width: SizeConfig.blockSizeHorizontal * 50,
                    height: SizeConfig.blockSizeHorizontal * 50,
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  TextField(
                      keyboardType: TextInputType.text,
                      textInputAction: TextInputAction.next,
                      controller: emailController,
                      style: const TextStyle(
                          fontSize: 14, color: ColorPalette.black),
                      decoration: Component.decorationNoBorder("Email",
                          iconPrefix: Icons.email)),
                  const SizedBox(
                    height: 20,
                  ),
                  TextField(
                      obscureText: true,
                      keyboardType: TextInputType.text,
                      textInputAction: TextInputAction.done,
                      controller: passwordController,
                      style: const TextStyle(
                          fontSize: 14, color: ColorPalette.black),
                      decoration: Component.decorationNoBorder("Password",
                          iconPrefix: Icons.lock)),
                  const SizedBox(
                    height: 20,
                  ),
                  Component.button(
                      label: "Log in",
                      onPressed: () {
                        onLogin();
                      }),
                  const SizedBox(
                    height: 15,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Component.textDefault("Don't have an account ? "),
                      InkWell(
                        onTap: () {
                          routePush(Register(), RouterType.material);
                        },
                        child: Component.textBold("Sign Up",
                            colors: ColorPalette.blue),
                      ),
                    ],
                  )
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
