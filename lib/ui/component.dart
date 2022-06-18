import 'package:tripkuy/core/app/app.dart';
import 'package:nav_router/nav_router.dart';
import 'package:tripkuy/core/util/size_config.dart';
import 'package:flutter/material.dart';

import '../core/util/benpay_cupertino_dialog.dart';

class Component {

  static appBar(String title, {bool transparet = false, bool buttonBack = true}) => AppBar(
    backgroundColor: transparet ? Colors.transparent : ColorPalette.white,
    elevation: 0.0,
    title: Component.textBold(
      title, 
      fontSize: Constant.fontSizeLargeExtra,
      colors: transparet ? ColorPalette.white : ColorPalette.darkBlue
    ),
    automaticallyImplyLeading: buttonBack,
    leading: InkWell(
      onTap: (){
        Navigator.of(navGK.currentContext!).pop();
      },
      child: const Icon(Icons.arrow_back, color: ColorPalette.darkBlue)
    )
  );

  static AppBar appBarLogo(){
    return AppBar(
      centerTitle: false,
      automaticallyImplyLeading: false,
      backgroundColor: ColorPalette.white,
      elevation: 0.0,
      title: Image.asset(
        "assets/icons/logo.png",
        width: SizeConfig.blockSizeHorizontal * 40,
      ),
    );
  }

  static appBarHeader(String title, {bool transparet = false}) => AppBar(
    backgroundColor: transparet ? Colors.transparent : ColorPalette.white,
    elevation: 0.0,
    title: Component.textBold(title, colors: ColorPalette.darkBlue),
    automaticallyImplyLeading: true,
  );

  static Text textBold(String content, {Color colors = Colors.black87,
    double fontSize = 15,
    int maxLines = 2,
    TextAlign textAlign = TextAlign.start}) {
    return Text(
      content,
      maxLines: maxLines,
      textAlign: textAlign,
      style: TextStyle(
        fontWeight: FontWeight.bold,
        color: colors,
        fontFamily: Constant.poppinsRegular,
        fontSize: fontSize.toDouble(),
        overflow: TextOverflow.ellipsis,
      ),
    );
  }

  static Text textDefault(
    String content,
    {Color colors = Colors.black54,
    double fontSize = 15,
    FontWeight fontWeight = FontWeight.normal,
    int maxLines = 2,
    TextAlign textAlign = TextAlign.start}) {
    return Text(
      content,
      maxLines: maxLines,
      textAlign: textAlign,
      style: TextStyle(
        fontWeight: fontWeight,
        color: colors,
        fontFamily: Constant.poppinsRegular,
        fontSize: fontSize.toDouble(),
        overflow: TextOverflow.ellipsis,
      ),
    );
  }

  static InputDecoration inputDecoration(String label, {String? hintText, Widget? suffixIcon}) => InputDecoration(
    fillColor: ColorPalette.darkBlue,
    enabledBorder: OutlineInputBorder(
      borderRadius: BorderRadius.circular(10.0),
      borderSide: const BorderSide(color: ColorPalette.darkBlue),
    ),
    focusedBorder: OutlineInputBorder(
      borderRadius: BorderRadius.circular(10.0),
      borderSide: const BorderSide(color: ColorPalette.darkBlue),
    ),
    errorBorder: OutlineInputBorder(
      borderRadius: BorderRadius.circular(10.0),
      borderSide: const BorderSide(color: ColorPalette.darkBlue),
    ),
    counterText: "",
    hintText: hintText,
    contentPadding: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
    labelText: label,
    labelStyle: const TextStyle(fontSize: Constant.fontSizeMedium, color: ColorPalette.darkBlue),
    suffixIcon: suffixIcon,
    hintStyle: const TextStyle(fontSize: Constant.fontSizeSmall, color: ColorPalette.darkBlue)
  );

  static decorationNoBorder(String hint, {IconData? iconPrefix}) => InputDecoration(
    // fillColor: ColorPalette.blueLight.withAlpha(50),
    filled: true,
    border: OutlineInputBorder(
      borderSide: const BorderSide(color: Colors.white),
      borderRadius: BorderRadius.circular(10)
    ),
    enabledBorder: OutlineInputBorder(
      borderSide: const BorderSide(color: Colors.white),
      borderRadius: BorderRadius.circular(10)
    ),
    focusedBorder: OutlineInputBorder(
      borderRadius: BorderRadius.circular(10.0),
      borderSide: const BorderSide(color: ColorPalette.white),
    ),
    errorBorder: OutlineInputBorder(
      borderRadius: BorderRadius.circular(10.0),
      borderSide: const BorderSide(color: ColorPalette.white),
    ),
    // prefixIcon: iconPrefix != null ? Icon(
    //   iconPrefix,
    //   color: ColorPalette.black,
    //   size: 30,
    // ) : null,
    counterText: "",
    hintText: hint,
    contentPadding: const EdgeInsets.symmetric(horizontal: 20),
    hintStyle: const TextStyle(fontSize: 13.0, color: ColorPalette.black, fontWeight: FontWeight.w500)
  );

  static button({required String label, required VoidCallback? onPressed, Color color = ColorPalette.blue}){
    return ElevatedButton(
      style: ElevatedButton.styleFrom(
        primary: color,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10.0)
        ),
      ),
      onPressed: onPressed,
      child: Container(
        width: SizeConfig.blockSizeHorizontal * 100,
        padding: const EdgeInsets.symmetric(horizontal: 10.0, vertical: 15),
        child: Text(
          label,
          textAlign: TextAlign.center,
        ),
      ),
    );
  }

  static header() => Image.asset(
    "assets/images/header.png",
    fit: BoxFit.fill,
    height: SizeConfig.blockSizeVertical * 20,
    width: SizeConfig.blockSizeHorizontal * 100,
  );

  static Widget divider({int padding = 8}) {
    return const Padding(
      padding: EdgeInsets.symmetric(vertical: 10),
      child: Divider(
        color: ColorPalette.grey,
        height: 1,
      ),
    );
  }

  static BoxDecoration backgroundPPOB()  {
    return const BoxDecoration(
      image: DecorationImage(
        image: AssetImage(
          "assets/images/header.png",
        ),
        fit: BoxFit.cover,
      ),
    );
  }

  static Widget notice(String notice) {
    return Flexible(
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          const Icon(Icons.info, color: ColorPalette.darkBlue,),
          const SizedBox(width: 10,),
          Flexible(
            child: Component.textDefault(
              notice,
              fontSize: Constant.fontSizeMedium,
              maxLines: 10
            ),
          )
        ],
      ),
    );
  }

  static Future<bool> showDialogWithRichText(RichText? text, {bool barrierDismissible = true}) async {
    bool isClosed = false;
    await cupertionDialog(
      builder: (BuildContext buildContext) {
        return GestureDetector(
          onTap: () {
            Navigator.pop(buildContext);
          },
          child: BenpayCupertinoDialog(
            content: text,
          ),
        );
      },
      barrierDismissible: barrierDismissible,
    ).whenComplete(() {
      isClosed = true;
    });
    return isClosed;
  }

  static emptyRecent(){
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 20),
      child: textBold("Belum ada transaksi", textAlign: TextAlign.center)
    );
  }

}