import 'package:flutter/material.dart';

class DropDownScreen extends StatefulWidget {
  const DropDownScreen({Key? key}) : super(key: key);

  @override
  State<DropDownScreen> createState() => _DropDownScreenState();
}

class _DropDownScreenState extends State<DropDownScreen> {
  String currentModels = "Model1";
  @override
  Widget build(BuildContext context) {
    return DropdownButton(
        items: [],
        value: currentModels,

        onChanged: (value) {
          setState(() {
            currentModels = value.toString();
          });
        });
  }
}
