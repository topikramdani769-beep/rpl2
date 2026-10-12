import 'package:flutter/material.dart';

class RowWidget extends StatelessWidget {
  const RowWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
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