import 'package:flutter/material.dart';
import '../../const/color.dart';

class HomeDrawer extends StatelessWidget {
  const HomeDrawer({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Drawer(
        backgroundColor: PRIMARY_COLOR,
      ),
    );
  }
}