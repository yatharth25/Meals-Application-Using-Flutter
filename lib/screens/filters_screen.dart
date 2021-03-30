import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class FlitersScreen extends StatelessWidget {
  static const routeName = '/filters';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(title: Text('Filters')),
        body: Center(child: Text('FILTERS')));
  }
}
