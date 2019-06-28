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
  TextEditingController _textEditingController =
      TextEditingController(text: 'Hey hey');

  void _incrementCounter() {
    setState(() {
      _counter++;
    });
  }

  void _decrementCounter() {
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
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: <Widget>[
            Text(
              'You have pushed the button this many times:',
            ),
            Semantics(
              label: 'Counter button',
              hint: 'Press to increase',
              value: '$_counter',
              onTap: _incrementCounter,
              //enabled: true,
              //container: true,
              //excludeSemantics: true,
              //onLongPress: _decrementCounter,
              child: ExcludeSemantics(
                child: Text(
                  '$_counter',
                  style: Theme.of(context).textTheme.display1,
                ),
              ),
            ),
            MergeSemantics(
              child: Semantics(
                onCopy: () {
                  debugPrint('Hey, where are you taking that?');
                },
                onCut: () {
                  debugPrint('Give it back!');
                },
                onPaste: () {
                  debugPrint('All right, do not do that again though.');
                },
                child: TextField(
                  controller: _textEditingController,
                  autocorrect: false,
                ),
              ),
            ),
            SizedBox(
              width: 100,
              height: 100,
              child: MergeSemantics(
                child: Stack(
                  children: <Widget>[
                    Positioned(
                      top: 0,
                      left: 0,
                      width: 50,
                      height: 50,
                      child: Semantics(
                        label: "Red",
                        child: Container(color: Colors.red),
                      ),
                    ),
                    Positioned(
                      top: 25,
                      left: 25,
                      width: 50,
                      height: 50,
                      child: Semantics(
                        label: "Green",
                        child: Container(color: Colors.green),
                      ),
                    ),
                    Positioned(
                      top: 50,
                      left: 50,
                      width: 50,
                      height: 50,
                      child: Semantics(
                        label: "Blue",
                        child: Container(color: Colors.blue),
                      ),
                    )
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
