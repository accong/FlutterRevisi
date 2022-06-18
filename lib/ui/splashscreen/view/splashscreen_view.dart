import 'package:tripkuy/core/app/app.dart';
import 'package:flutter/material.dart';
import 'package:tripkuy/ui/splashscreen/cubit/splashscreen_cubit.dart';

import '../../../core/util/util.dart';
import '../../component.dart';

class SplashscreenView extends StatefulWidget {

  const SplashscreenView({Key? key}) : super(key: key);

  @override
  State<SplashscreenView> createState() => _SplashscreenViewState();
}

class _SplashscreenViewState extends State<SplashscreenView> {

  @override
  void initState() {
    SplashscreenCubit().checkSessions();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return Scaffold(
      resizeToAvoidBottomInset: false,
      backgroundColor: ColorPalette.darkBlue,
      body: Stack(
        children: [
          Container(
            height: SizeConfig.safeBlockVertical * 50,
            width: SizeConfig.blockSizeHorizontal * 100,
            decoration: const BoxDecoration(
              image: DecorationImage(
                image: AssetImage("assets/images/header_login.png"),
                fit: BoxFit.fill,
              ),
            ),
          ),
          Center(
            child: Image.asset(
              "assets/icons/logo_pintupay_white.png",
              width: SizeConfig.blockSizeHorizontal * 70,
              fit: BoxFit.fill,
            ),
          ),
          Positioned(
            bottom: 20.0,
            child: Container(
              width: SizeConfig.blockSizeHorizontal * 100,
              alignment: Alignment.center,
              child: Component.textDefault(
                CoreFunction.version() + " (5)",
                fontSize: 13,
                textAlign: TextAlign.center,
                colors: ColorPalette.white
              ),
            ),
          )
        ],
      )
    );
  }
}