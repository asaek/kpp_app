import 'package:flutter/material.dart';

class MenuDrawer extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return const Drawer(
      child: SizedBox(
        width: 200,
        height: double.infinity,
        child: Material(
          color: Colors.pinkAccent,
        ),
      ),
    );
  }
}
