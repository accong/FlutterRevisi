import 'package:flutter/material.dart';
import 'package:tripkuy/ui/component.dart';

class ExploreView extends StatelessWidget {
  const ExploreView({ Key? key }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Component.textBold("Explore View"),
      ),
    );
  }
}

