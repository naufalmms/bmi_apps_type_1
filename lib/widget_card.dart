import 'package:flutter/cupertino.dart';

class WidgetCard extends StatelessWidget {
  const WidgetCard(
      {super.key,
      required this.colour,
      required this.child,
      required this.onPress});

  final Color colour;
  final Widget child;
  final Function onPress;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: (() {
        onPress();
      }),
      child: Container(
        child: child,
        margin: EdgeInsets.all(10.0),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20),
          color: colour,
        ),
      ),
    );
  }
}
