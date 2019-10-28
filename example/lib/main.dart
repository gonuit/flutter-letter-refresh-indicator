import 'package:flutter/material.dart';
import 'package:letter_refresh_indicator/letter_refresh_indicator.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'letter_refresh_indicator demo',
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("letter_refresh_indicator demo")),
      body: LetterRefreshIndicator(
        accent: Colors.lightGreen,
        onRefresh: () async => Future<void>.delayed(Duration(seconds: 2)),
        child: ListView(
          children: <Widget>[],
        ),
      ),
    );
  }
}
