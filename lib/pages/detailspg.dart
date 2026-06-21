import 'package:flutter/material.dart';

class Detailspg extends StatefulWidget {
  const Detailspg({super.key});

  @override
  State<Detailspg> createState() => _DetailspgState();
}

class _DetailspgState extends State<Detailspg> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Details Page'),
        centerTitle: true,
      ),
    );
  }
}