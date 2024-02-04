import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  TextEditingController _controllerLine1 = TextEditingController();
  TextEditingController _controllerLine2 = TextEditingController();
  TextEditingController _controllerReverse = TextEditingController();
  TextEditingController _controllerCount = TextEditingController();
  TextEditingController _controllerSearchString = TextEditingController();
  TextEditingController _controllerSearchSubstring = TextEditingController();

  String combinedString = '';
  String reversedString = '';
  int characterCount = 0;
  List<int> substringIndexes = [];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('String Processing App'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            TextField(
              controller: _controllerLine1,
              decoration: InputDecoration(labelText: 'Enter line 1'),
            ),
            TextField(
              controller: _controllerLine2,
              decoration: InputDecoration(labelText: 'Enter line 2'),
            ),
            ElevatedButton(
              onPressed: () {
                combineStrings();
              },
              child: Text('Combine Strings'),
            ),
            Text('Combined String: $combinedString'),
            SizedBox(height: 20),
            TextField(
              controller: _controllerReverse,
              decoration: InputDecoration(labelText: 'Enter a string to reverse'),
            ),
            ElevatedButton(
              onPressed: () {
                reverseString();
              },
              child: Text('Reverse String'),
            ),
            Text('Reversed String: $reversedString'),
            SizedBox(height: 20),
            TextField(
              controller: _controllerCount,
              decoration: InputDecoration(labelText: 'Enter a string to count characters'),
            ),
            ElevatedButton(
              onPressed: () {
                countCharacters();
              },
              child: Text('Count Characters'),
            ),
            Text('Character Count: $characterCount'),
            SizedBox(height: 20),
            TextField(
              controller: _controllerSearchString,
              decoration: InputDecoration(labelText: 'Enter a string to search'),
            ),
            TextField(
              controller: _controllerSearchSubstring,
              decoration: InputDecoration(labelText: 'Enter a substring to search for'),
            ),
            ElevatedButton(
              onPressed: () {
                searchSubstring();
              },
              child: Text('Search for Substring'),
            ),
            Text('Substring Indexes: ${substringIndexes.join(', ')}'),
          ],
        ),
      ),
    );
  }

  void combineStrings() {
    setState(() {
      combinedString = _controllerLine1.text + _controllerLine2.text;
    });
  }

  void reverseString() {
    setState(() {
      reversedString = _controllerReverse.text.split('').reversed.join();
    });
  }

  void countCharacters() {
    setState(() {
      characterCount = _controllerCount.text.replaceAll(' ', '').length;
    });
  }

  void searchSubstring() {
    setState(() {
      substringIndexes = [];
      String searchString = _controllerSearchString.text;
      String substring = _controllerSearchSubstring.text;

      for (int i = 0; i < searchString.length - substring.length + 1; i++) {
        if (searchString.substring(i, i + substring.length) == substring) {
          substringIndexes.add(i);
        }
      }
    });
  }
}

