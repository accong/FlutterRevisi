import 'package:flutter/material.dart';
import 'package:tripkuy/core/app/app.dart';
import 'package:tripkuy/core/util/util.dart';
import 'package:tripkuy/ui/component.dart';
import 'package:tripkuy/ui/login/login_view.dart';
import 'package:tripkuy/ui/register/register_view.dart';

class LandingView extends StatelessWidget {
  const LandingView({ Key? key }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
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
            padding: EdgeInsets.symmetric(
              horizontal: SizeConfig.blockSizeHorizontal * 10,
              vertical: SizeConfig.blockSizeHorizontal * 10
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                SizedBox(height: SizeConfig.blockSizeVertical * 25,),
                Image.asset(
                  "assets/images/image_splash_screen.png",
                  width: SizeConfig.blockSizeHorizontal * 50,
                  height: SizeConfig.blockSizeHorizontal * 50,
                ),
                SizedBox(height: SizeConfig.blockSizeVertical * 8,),
                Component.textBold(
                  "Welcome To TripKUY",
                  fontSize: 16,
                  textAlign: TextAlign.center,
                  colors: ColorPalette.black
                ),
                const SizedBox(height: 20,),
                Component.textBold(
                  "Get Started",
                  fontSize: 20,
                  colors: ColorPalette.white
                ),
                const SizedBox(height: 20,),
                const Spacer(),
                Component.button(
                  label: "Get Started", 
                  onPressed: (){
                    routePush(LoginView(), RouterType.material);
                  }
                ),
                const SizedBox(height: 20,),
              ],
            ),
          ),
        ],
      ),
    );
  }
}