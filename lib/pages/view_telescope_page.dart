import 'package:flutter/material.dart';

class ViewTelescopePage extends StatefulWidget {
  const ViewTelescopePage({super.key});

  static const String routeName = "viewtelescope";

  @override
  State<ViewTelescopePage> createState() => _ViewTelescopePageState();
}

class _ViewTelescopePageState extends State<ViewTelescopePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Text("Add TeleScope"),
      ),
    );
  }
}
