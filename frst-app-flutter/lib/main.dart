import 'package:flutter/material.dart';
import 'dart:math';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Name Generator',
      theme: ThemeData(primarySwatch: Colors.blue),
      home: NameGeneratorHomePage(),
    );
  }
}

class NameGeneratorHomePage extends StatefulWidget {
  @override
  _NameGeneratorHomePageState createState() => _NameGeneratorHomePageState();
}

class _NameGeneratorHomePageState extends State<NameGeneratorHomePage> {
  String _generatedName = '';

  void _generateName() {
    const prefixes = ['new', 'light', 'main', 'gray'];
    const suffixes = ['stay', 'stream', 'brake', 'pine'];

    final random = Random();
    final prefix = prefixes[random.nextInt(prefixes.length)];
    final suffix = suffixes[random.nextInt(suffixes.length)];

    setState(() {
      _generatedName = '$prefix$suffix';
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Random Name Generator')),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(
              _generatedName,
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: _generateName,
              child: Text('Generate Name'),
            ),
          ],
        ),
      ),
    );
  }
}
