import 'package:comic_mobile_app/widgets/buttons/IconButtonTypeA.dart';
import 'package:comic_mobile_app/widgets/buttons/TextButtonTypeA.dart';
import 'package:comic_mobile_app/widgets/buttons/TextButtonTypeb.dart';
import 'package:comic_mobile_app/widgets/inputs/textboxes/InputTextBox.dart';
import 'package:comic_mobile_app/widgets/texts/content/ContentTextA.dart';
import 'package:comic_mobile_app/widgets/texts/titles/TitleTypeA.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _counter = 0;

  void _incrementCounter() {
    setState(() {
      _counter++;
    });
  }

  VoidCallback callBackExample = () {
    print("call back is working");
  };

  void callBackExample_2(String id) {
    print("id: " + id);
  }

  void printText(String text) {
    print(text);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            const Text(
              'You have pushed the button this many times:',
            ),
            Text(
              '$_counter',
              style: Theme.of(context).textTheme.headline4,
            ),
            TextButtonTypeA("Test", callBackExample),
            IconButtonTypeA(
                "test", "atatatat", Icons.how_to_reg_sharp, callBackExample_2,
                margin: 5),
            TextButtonTypeB("test", callBackExample),
            TitleTypeA("Test At Title"),
            InputTextBox("Enter Test", printText),
            InputTextBox("Enter Test", printText),
            InputTextBox("Enter Test", printText),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _incrementCounter,
        tooltip: 'Increment',
        child: const Icon(Icons.add),
      ), // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}
