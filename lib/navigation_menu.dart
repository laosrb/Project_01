import 'package:flutter/material.dart';


class NavigationMenu extends StatelessWidget {
  const NavigationMenu({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: NavigationBar(
        destinations: [
          Container(color: Colors.white,),
          Container(color: Colors.black,),
          Container(color: Colors.red,),
        ],)
    );
  }
}