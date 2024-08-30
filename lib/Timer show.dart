import 'dart:async';
import 'package:flutter/material.dart';

class TimerApp extends StatefulWidget {
  @override
  _TimerAppState createState() => _TimerAppState();
}

class _TimerAppState extends State<TimerApp> {
  final StreamController<int> _controller = StreamController<int>();
  Timer? _timer;
  int _counter = 0;
  bool _isPaused = false;

  @override
  void dispose() {
    _controller.close();
    super.dispose();
  }

  void startTimer() {
    _timer = Timer.periodic(Duration(seconds: 1), (timer) {
      if (!_isPaused) {
        _counter++;
        _controller.add(_counter);
      }
    });
  }

  void pauseTimer() {
    _isPaused = true;
  }

  void resumeTimer() {
    _isPaused = false;
  }

  void stopTimer() {
    if (_timer != null) {
      _timer!.cancel();
      _timer = null;
      _controller.add(_counter);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('Timer App'),
        ),
        body: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            Center(
                child: StreamBuilder<int>(
                  stream: _controller.stream,
                  builder: (context, snapshot) {
                    if (snapshot.hasData) {
                      return  Text(
                        'Timer: ${snapshot.data}',
                        style: TextStyle(fontSize: 24.0),
                      );
                    } else {
                      return const Text(
                        'Timer: 0',
                        style: TextStyle(fontSize: 24.0),
                      );
                    }
                  },
                ),
              ),


            SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                startTimer();
              },
              child: Text('Start'),
            ),
            SizedBox(height: 10),
            ElevatedButton(
              onPressed: () {
                pauseTimer();
              },
              child: Text('Pause'),
            ),
            SizedBox(height: 10),
            ElevatedButton(
              onPressed: () {
                resumeTimer();
              },
              child: Text('Resume'),
            ),
            SizedBox(height: 10),
            ElevatedButton(
              onPressed: () {
                stopTimer();
              },
              child: Text('Stop'),
            ),
          ],
        ));
  }
}
