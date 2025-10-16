import 'package:flutter/material.dart';

class BackgroundContainer extends StatelessWidget {
  final Widget child;
  const BackgroundContainer({super.key, required this.child});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: double.infinity,
      decoration: BoxDecoration(
        color: Color(0XFF0B1519),
        image: DecorationImage(
          image: AssetImage("assets/images/background.png"),
          fit: BoxFit.fill,
        ),
      ),
      child: child,
    );
  }
}
