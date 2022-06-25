import 'package:flutter/material.dart';
import 'package:tripkuy/ui/component.dart';
import 'package:tripkuy/core/app/app.dart';
import 'package:tripkuy/core/util/util.dart';
import 'package:tripkuy/ui/profile/view/second_profile.dart';
class FavoriteView extends StatelessWidget {
  const FavoriteView({ Key? key }) : super(key: key);

Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: ColorPalette.white,
          elevation: 0.0,
          leading: const Icon(
            Icons.menu,
            color: ColorPalette.grey,
          ),
          actions: [
            const Icon(
              Icons.notifications,
              color: ColorPalette.blueLight,
            ),
            const SizedBox(
              width: 20,
            )
          ],
        ),
        backgroundColor: ColorPalette.white,
        body: Padding(
          padding: Constant.paddingScreen,
          child: ListView(
            children: [
              Component.textBold("Favourite Places", fontSize: 20),
              const SizedBox(
                height: 20,
              ),
              favourite()
            ],
          ),
        ));
  }

Widget favourite() {
    return ListView.builder(
      itemCount: Constant.listRecommended.length,
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      itemBuilder: (BuildContext context, int index) {
        return Container(
          margin: const EdgeInsets.symmetric(vertical: 10, horizontal: 10),
          child: Row(
            children: [
              ClipRRect(
                  borderRadius: const BorderRadius.all(Radius.circular(20)),
                  child: Image.network(
                    Constant.listRecommended[index].image!,
                    height: 100,
                    width: 100,
                    fit: BoxFit.cover,
                  )),
              const SizedBox(
                width: 10,
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      const Icon(
                        Icons.location_on,
                        color: ColorPalette.blueLight,
                        size: 20,
                      ),
                      const SizedBox(
                        width: 10,
                      ),
                      Component.textDefault(
                          Constant.listRecommended[index].location!,
                          fontSize: 11,
                          colors: ColorPalette.blueLight),
                    ],
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 5.0),
                    child: Component.textBold(
                        Constant.listRecommended[index].nama!,
                        fontSize: 20,
                        colors: ColorPalette.black),
                  ),
                  Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      const Icon(
                        Icons.favorite,
                        color: Colors.red,
                        size: 20,
                      ),
                      const SizedBox(
                        width: 10,
                      ),
                    ],
                  ),
                ],
              )
            ],
          ),
        );
      },
    );
  }
}