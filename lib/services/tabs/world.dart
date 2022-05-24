import 'package:flutter/material.dart';

class World extends StatefulWidget {
  String title;
  World({
    Key? key,
    required this.title
  }) : super(key: key);

  @override
  State<World> createState() => _WorldState();
}

class _WorldState extends State<World> {
  @override
  Widget build(BuildContext context) {
    return Container();
  }
}
