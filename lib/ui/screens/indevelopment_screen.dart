import 'package:flutter/material.dart';
import 'package:simple_gallery/const.dart';

class InDevelopmentScreen extends StatelessWidget {

  const InDevelopmentScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Text(Strings.inDevelopment,
          style: Styles.textHeaderStyle,
        ),
      )
    );
  }
}
