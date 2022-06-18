import 'package:flutter/material.dart';
import 'package:tripkuy/core/app/app.dart';

import '../component.dart';

class TourGuideView extends StatelessWidget {
  const TourGuideView({ Key? key }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: Component.appBar("Data Tourguide", buttonBack: false),
      backgroundColor: ColorPalette.white,
      body: ListView.builder(
        padding: Constant.paddingScreen,
        itemCount: Constant.listTourguide.length,
        itemBuilder: (BuildContext context, int index) {
          return Card(
            margin: EdgeInsets.only(top: 5, bottom: index == (Constant.listTourguide.length -1) ? 100 : 5),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(10)
            ),
            child: Padding(
              padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 10),
              child: Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const SizedBox(height: 10,),
                      Component.textBold(
                        Constant.listTourguide[index].nama ?? "",
                        fontSize: Constant.fontSizeLargeExtra
                      ),
                      const SizedBox(height: 10,),
                      Component.textDefault(
                        Constant.listTourguide[index].email ?? "",
                        fontSize: Constant.fontSizeMedium
                      ),
                      const SizedBox(height: 10,),
                      Component.textDefault(
                        Constant.listTourguide[index].phone ?? "",
                        fontSize: Constant.fontSizeMedium
                      ),
                    ],
                  ),
                  const Spacer(),
                  Component.textBold(
                    Constant.listTourguide[index].location ?? "",
                    fontSize: Constant.fontSizeLargeExtra,
                    colors: ColorPalette.lightPurple
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}