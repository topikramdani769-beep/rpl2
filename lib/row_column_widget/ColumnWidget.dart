import 'package:flutter/material.dart';

class ColumnWidget extends StatelessWidget {
  const ColumnWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text('Ini isi Row 1'),
        Text('Ini isi Row 2'),
        Text('Ini isi Row 3'),
        FlutterLogo(
          size: 50,
          textColor: Colors.blue,
        ),
      ],
    );
  }
}
