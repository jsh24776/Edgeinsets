import 'package:flutter/material.dart';

void main() => runApp(
  const MaterialApp(debugShowCheckedModeBanner: false, home: EdgeInsetsDemo()),
);

class EdgeInsetsDemo extends StatelessWidget {
  const EdgeInsetsDemo({super.key});

  @override
  Widget build(BuildContext context) => Scaffold(
    appBar: AppBar(title: const Text('Regidor')),
    body: Padding(
      padding: const EdgeInsets.only(top: 10),
      child: Column(
        spacing: 30,
        children: [
          box(
            'EdgeInsets.all(30)',
            const EdgeInsets.all(30),
            Colors.red,
            Colors.black,
          ),
          box(
            'EdgeInsets.symmetric(horizontal: 40, vertical: 10)',
            const EdgeInsets.symmetric(horizontal: 40, vertical: 10),
            Colors.yellow,
            Colors.black,
          ),
          box(
            'EdgeInsets.only(left: 30, top: 10, right: 5, bottom: 20)',
            const EdgeInsets.only(left: 30, top: 10, right: 5, bottom: 20),
            Colors.blue,
            Colors.white,
            margin: const EdgeInsets.symmetric(horizontal: 15),
          ),
          box(
            'EdgeInsets.fromLTRB(10, 20, 30, 40)',
            const EdgeInsets.fromLTRB(10, 20, 30, 40),
            Colors.green,
            Colors.white,
          ),
        ],
      ),
    ),
  );
}

Widget box(
  String label,
  EdgeInsets padding,
  Color color,
  Color textColor, {
  EdgeInsets margin = EdgeInsets.zero,
}) => Container(
  margin: margin,
  color: color,
  padding: padding,
  child: FittedBox(
    fit: BoxFit.scaleDown,
    child: Text(
      label,
      maxLines: 1,
      softWrap: false,
      style: TextStyle(color: textColor),
    ),
  ),
);
