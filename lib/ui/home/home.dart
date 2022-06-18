import 'package:flutter/material.dart';
import 'package:tripkuy/core/app/app.dart';
import 'package:tripkuy/core/util/util.dart';
import 'package:tripkuy/ui/component.dart';

class HomeView extends StatelessWidget {
  const HomeView({ Key? key }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: ColorPalette.white,
        elevation: 0.0,
        leading: const Icon(Icons.menu, color: ColorPalette.grey,),
        actions: [
          const Icon(Icons.notifications, color: ColorPalette.blueLight,),
          const SizedBox(width: 20,)
        ],
      ),
      backgroundColor: ColorPalette.white,
      body: Padding(
        padding: Constant.paddingScreen,
        child: ListView(
          children: [
            Component.textBold("Discover", fontSize: 17),
            const SizedBox(height: 30,),
            TextField(
              keyboardType: TextInputType.text,
              style: const TextStyle(fontSize: 14, color: ColorPalette.grey),
              decoration:  InputDecoration(
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
                suffixIcon: const Icon(
                  Icons.search,
                  color: ColorPalette.blueLight,
                  size: 30,
                ),
                counterText: "",
                hintText: "Search your trip",
                contentPadding: const EdgeInsets.symmetric(horizontal: 20),
                hintStyle: const TextStyle(fontSize: 13.0, color: ColorPalette.grey, fontWeight: FontWeight.w500)
              ),
            ),
            const SizedBox(height: 20,),
            SizedBox(
              height: 50,
              child: buildListViewHeader(Constant.listCategory, 0)
            ),
            const SizedBox(height: 10,),
            SizedBox(
              height: 250,
              width: SizeConfig.blockSizeHorizontal * 100,
              child: destination(),
            ),
            const SizedBox(height: 50,),
            Component.textBold("Recommended Places", fontSize: 17),
            const SizedBox(height: 20,),
            recommended()
          ],
        ),
      )
    );
  }

  Widget destination() {
    return ListView.builder(
      scrollDirection: Axis.horizontal,
      itemCount: Constant.listDestination.length,
      shrinkWrap: true,
      itemBuilder: (BuildContext context, int index) {
        return Container(
          height: 250,
          width: 180,
          margin: const EdgeInsets.only(right: 10),
          child: Stack(
            children: [
              ClipRRect(
                borderRadius: const BorderRadius.all(Radius.circular(20)),
                child: Image.asset(
                  Constant.listDestination[index].image!,
                  height: 250,
                  width: 180,
                  fit: BoxFit.cover,
                )
              ),
              Positioned(
                bottom: 15.0,
                left: 10.0,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Component.textBold(
                      Constant.listDestination[index].nama!,
                      fontSize: 12,
                      colors: ColorPalette.white
                    ),
                    const SizedBox(height: 10,),
                    Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        const Icon(Icons.location_on, color: Colors.amber,),
                        Component.textBold(
                          Constant.listDestination[index].location!,
                          fontSize: 12,
                          colors: ColorPalette.white
                        ),
                      ],
                    )
                  ],
                )
              )
            ],
          ),
        );
      },
    );
  }

  Widget recommended() {
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
                )
              ),
              const SizedBox(width: 10,),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      const Icon(Icons.location_on, color: ColorPalette.blueLight, size: 20,),
                      const SizedBox(width: 10,),
                      Component.textDefault(
                        Constant.listRecommended[index].location!,
                        fontSize: 11,
                        colors: ColorPalette.blueLight
                      ),
                    ],
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 5.0),
                    child: Component.textBold(
                      Constant.listRecommended[index].nama!,
                      fontSize: 20,
                      colors: ColorPalette.black
                    ),
                  ),
                  Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      const Icon(Icons.star, color: Colors.amber, size: 20,),
                      const SizedBox(width: 10,),
                      Component.textBold(
                        "5.0",
                        fontSize: 12,
                        colors: ColorPalette.grey
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

  Widget buildListViewHeader(List<String> listCategory, int indexCategory) {
    return ListView.builder(
      itemCount: listCategory.length,
      shrinkWrap: true,
      padding: const EdgeInsets.only(right: 10, bottom: 5, top: 5),
      scrollDirection: Axis.horizontal,
      itemBuilder: (context, index) => buildPaddingHeaderCard(listCategory[index], index, indexCategory),
    );
  }

  Padding buildPaddingHeaderCard(String all, int index, int indexCategory) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 5),
      // ignore: deprecated_member_use
      child: FlatButton(
        color: indexCategory == index ? ColorPalette.blueLight : ColorPalette.whiteBackground,
          shape: RoundedRectangleBorder(
            side: BorderSide(
              color: indexCategory == index ? ColorPalette.blueLight : ColorPalette.whiteBackground,
              width: 1,
              style: BorderStyle.solid
            ), 
          borderRadius: BorderRadius.circular(50)
        ),
        onPressed: () {

        },
        child: Component.textDefault(
          all, 
          colors: indexCategory == index ? ColorPalette.white : ColorPalette.grey,
          fontSize: 12
        ),
      ),
    );
  }


}