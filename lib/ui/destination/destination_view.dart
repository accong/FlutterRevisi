import 'package:flutter/material.dart';
import 'package:tripkuy/core/app/app.dart';
import 'package:tripkuy/core/util/util.dart';
import 'package:tripkuy/ui/component.dart';

class DestinationView extends StatelessWidget {
  const DestinationView ({ Key? key }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: Component.appBar("Tempat Wisata"),
      backgroundColor: ColorPalette.white,
      body: ListView.builder(
        itemCount: Constant.listDestination.length,
        shrinkWrap: true,
        itemBuilder: (BuildContext context, int index) {
          return Card(
            elevation: 3.0,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(10)
            ),
            margin: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
            child: Column(
              children: [
                ClipRRect(
                  borderRadius: const BorderRadius.only(
                    topRight: Radius.circular(10.0),
                    topLeft: Radius.circular(10.0),
                  ),
                  child: Image.network(
                    Constant.listDestination[index].image!,
                    height: SizeConfig.blockSizeHorizontal * 40,
                    width: SizeConfig.blockSizeHorizontal * 100,
                    fit: BoxFit.cover,
                  )
                ),
                const SizedBox(height: 10 ,),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Component.textDefault(
                        "${Constant.listDestination[index].nama ?? ""}, ${Constant.listDestination[index].location}", 
                        fontSize: 20, 
                        colors: ColorPalette.black
                      ),
                      const SizedBox(height: 6,),
                      Component.textDefault(
                        Constant.listDestination[index].desc ?? "", 
                        maxLines: 10
                      ),
                      const SizedBox(height: 10,),
                      Row(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Column(
                            mainAxisSize: MainAxisSize.min,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Component.textDefault(
                                "Tourguide : ${Constant.listDestination[index].tourguide}"
                              ),
                              const SizedBox(height: 6,),
                              Component.textDefault(
                                "Catering : ${Constant.listDestination[index].catering}"
                              ),
                            ],
                          ),
                          const Spacer(),
                          Component.textBold(
                            Constant.listDestination[index].price!,
                            colors: ColorPalette.red,
                            fontSize: 20
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}