import 'package:flutter/material.dart';

class CustomedIcon extends StatefulWidget {
  final IconData icon;
  final double? size;
  const CustomedIcon({
    super.key,
    required this.icon,
    required this.size
  });
  @override
  State<CustomedIcon> createState() => _CustomedIconState();
}

class _CustomedIconState extends State<CustomedIcon>{

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    /**
        if (kDebugMode) {
        print("[CustomedIcon] Called !");
        }**/
    return Icon(
        widget.icon,
        size: widget.size
    );
  }
}
