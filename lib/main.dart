import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      // showSemanticsDebugger: true,
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _counter = 0;

  void _incrementCounter() {
    debugPrint('Increasing to ${_counter + 1}');
    setState(() {
      _counter++;
    });
  }

  void _decrementCounter() {
    debugPrint('Decreasing to ${_counter - 1}');
    setState(() {
      _counter--;
    });
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
            Text(
              'You have pushed the button this many times:',
            ),
            Semantics(
                label: 'Counter button',
                hint: 'Press to increase',
                value: '$_counter',
                enabled: true,
                container: true,
                excludeSemantics: true,
                onTap: _incrementCounter,
                onLongPress: _decrementCounter,
                child: Text(
                  '$_counter',
                  style: Theme.of(context).textTheme.display1,
                )),
          ],
        ),
      ),
    );
  }
}
