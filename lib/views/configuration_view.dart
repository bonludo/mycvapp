import 'package:flutter/material.dart';
import 'package:mycv/themes/color_sets.dart';

class ConfigurationPage extends StatefulWidget {
  final Function(String) changeColors;

  ConfigurationPage({required this.changeColors});

  @override
  _ConfigurationPageState createState() => _ConfigurationPageState();
}

class _ConfigurationPageState extends State<ConfigurationPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Configuration'),
      ),
      body: ListView.builder(
        itemCount: colorMap.length,
        itemBuilder: (context, index) {
          String colorKey = colorMap.keys.elementAt(index);
          return ListTile(
            title: Text(colorKey),
            onTap: () {
              widget.changeColors(colorKey);
              Navigator.pop(context);
            },
          );
        },
      ),
    );
  }
}
