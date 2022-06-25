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
                height: 20,
              ),

              const Icon(Icons.person, size: 100, color: ColorPalette.grey,),
              SizedBox(height: SizeConfig.blockSizeVertical * 5,),
              TextField(
                      keyboardType: TextInputType.text,
                      textInputAction: TextInputAction.next,
                      style: const TextStyle(
                          fontSize: 14, color: ColorPalette.black),
                      decoration: Component.decorationBorder("Naufal Aditya",)),
                  const SizedBox(
                    height: 20,
                  ),
              TextField(
                      keyboardType: TextInputType.text,
                      textInputAction: TextInputAction.next,
                      style: const TextStyle(
                          fontSize: 14, color: ColorPalette.black),
                      decoration: Component.decorationBorder("naufal@gmail.com",
                          )),
                  const SizedBox(
                    height: 20,
                  ),
              TextField(
                      keyboardType: TextInputType.text,
                      textInputAction: TextInputAction.next,
                      style: const TextStyle(
                          fontSize: 14, color: ColorPalette.black),
                      decoration: Component.decorationBorder("08568959667",
                         )),
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