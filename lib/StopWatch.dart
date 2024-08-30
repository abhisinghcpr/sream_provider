import 'dart:async';
import 'package:flutter/material.dart';



class DateStram extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<DateStram> {
  final StreamController<String> _streamController = StreamController<String>();

  void _emitData() {
    _streamController.add(DateTime.now().toString());
  }

  @override
  void dispose() {
    _streamController.close();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Single Subscription'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            StreamBuilder<String>(
              stream: _streamController.stream,
              builder: (context, snapshot) {
                if (snapshot.hasData) {
                  return Text(
                    'Data: ${snapshot.data}',
                    style: TextStyle(fontSize: 20),
                  );
                } else {
                  return const Text(
                    'No Data',
                    style: TextStyle(fontSize: 20),
                  );
                }
              },
            ),

            SizedBox(height: 20),
            ElevatedButton(
              onPressed: _emitData,
              child: Text('Generate Data'),
            ),
          ],
        ),
      ),
    );
  }
}
