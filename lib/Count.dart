

import 'dart:async';

import 'package:flutter/material.dart';

class CounterApp extends StatefulWidget {
  @override
  _CounterAppState createState() => _CounterAppState();
}

class _CounterAppState extends State<CounterApp> {
  StreamController<int> _streamController = StreamController<int>();
  int _counter = 0;

  @override
  void dispose() {
    _streamController.close();
    super.dispose();
  }

  void _increment() {
    _counter++;
    _streamController.sink.add(_counter);
  }

  void _decrement() {
    _counter--;
    _streamController.sink.add(_counter);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Counter App'),
      ),
      body: Center(
        child: StreamBuilder<int>(
          stream: _streamController.stream,
          initialData: _counter,
          builder: (context, snapshot) {
            return Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Text(
                  'Counter: ${snapshot.data}',
                  style: TextStyle(fontSize: 24),
                ),
                SizedBox(height: 20),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    ElevatedButton(
                      onPressed: _increment,
                      child: Icon(Icons.add),
                    ),
                    SizedBox(width: 20),
                    ElevatedButton(
                      onPressed: _decrement,
                      child: Icon(Icons.remove),
                    ),
                  ],
                ),
              ],
            );
          },
        ),
      ),
    );
  }
}
