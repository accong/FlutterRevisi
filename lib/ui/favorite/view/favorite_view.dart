import 'package:flutter/material.dart';
import 'package:tripkuy/ui/component.dart';

class FavoriteView extends StatelessWidget {
  const FavoriteView({ Key? key }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Component.textBold("Favorite View"),
      ),
    );
  }
}