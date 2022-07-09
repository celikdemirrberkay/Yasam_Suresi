import 'package:flutter/material.dart';

class MyContainer extends StatefulWidget {
  final Color renk;
  final Widget? child;
  final Function()? onPress;
  final Function()? onDoublePress;
  MyContainer(
      {this.renk = Colors.white, this.child, this.onPress, this.onDoublePress});

  @override
  State<MyContainer> createState() => _MyContainerState();
}

class _MyContainerState extends State<MyContainer> {
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onDoubleTap: widget.onDoublePress,
      onTap: widget.onPress,
      child: Container(
        child: widget.child,
        margin: EdgeInsets.all(12.0),
        decoration: BoxDecoration(
          color: widget.renk,
          borderRadius: BorderRadius.circular(20.0),
        ),
      ),
    );
  }
}
