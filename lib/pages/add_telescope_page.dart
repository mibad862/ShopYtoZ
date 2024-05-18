import 'package:flutter/material.dart';

class AddTelescopePage extends StatefulWidget {
  const AddTelescopePage({super.key});

  static const String routeName = "addtelescope";

  @override
  State<AddTelescopePage> createState() => _AddTelescopePageState();
}

class _AddTelescopePageState extends State<AddTelescopePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Text("Add TeleScope"),
      ),
    );
  }
}
