import 'package:flutter/material.dart';
import 'Pages/home_page.dart';

void main() => runApp(MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Myapp(),
    ));

class Myapp extends StatelessWidget {
  const Myapp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Homepage();
  }
}
