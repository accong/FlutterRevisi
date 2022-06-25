import 'package:flutter/material.dart';
import 'package:tripkuy/core/app/app.dart';
import 'package:tripkuy/core/util/util.dart';
import 'package:tripkuy/ui/component.dart';
import 'package:tripkuy/ui/profile/view/second_profile.dart';

class SecondProfile extends StatelessWidget {
  @override

  Widget build(BuildContext context){
    return Scaffold(
      appBar: AppBar(
        leading: BackButton(),
    
      ),
      backgroundColor: ColorPalette.white,
      body: Padding(
        padding: Constant.paddingScreen,
        child: Center(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Component.textBold("Account Details", fontSize: 17),
              const SizedBox(
                height: 100,
              ),

              const Icon(Icons.person, size: 100, color: ColorPalette.grey,),
              SizedBox(height: SizeConfig.blockSizeVertical * 5,),
              Component.textBold("Naufal Aditya", fontSize: 20),
              const SizedBox(
                height: 20,
              ),
              Component.textBold("naufal@gmail.com", fontSize: 10),
              const SizedBox(
                height: 10,
              ),
               Component.textBold("08568959667", fontSize: 10),
              const SizedBox(
                height: 20,
              ),
            ],

          ),
        ),
      )
    );
  }
}