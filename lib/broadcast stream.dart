// import 'dart:async';
// import 'package:flutter/material.dart';
// import 'package:intl/intl.dart';
//
//
// class TimerBloc {
//   final StreamController<DateTime> _timerController = StreamController<DateTime>();
//   late Timer _timer;
//   DateTime _currentTime = DateTime.now();
//   Stream<DateTime> get timerStream => _timerController.stream;
//   TimerBloc() {
//     _timer = Timer.periodic(const Duration(seconds: 1), _updateTimer);
//   }
//   void _updateTimer(Timer timer) {
//     _currentTime = DateTime.now();
//     _timerController.add(_currentTime);
//   }
//   void dispose() {
//     _timer.cancel();
//     _timerController.close();
//   }
// }
//
// class Homepage extends StatelessWidget {
//   final TimerBloc timerBloc = TimerBloc();
//   Homepage({super.key});
//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       home: Scaffold(
//
//         body: Center(
//           child: StreamBuilder<DateTime>(
//             stream: timerBloc.timerStream,
//             builder: (context, snapshot) {
//               if (snapshot.hasData) {
//                 DateTime currentTime = snapshot.data!;
//                 String formattedTime = DateFormat('HH:mm:ss').format(currentTime);
//                 List<String> timeParts = formattedTime.split(':');
//                 return Column(
//                   mainAxisAlignment: MainAxisAlignment.center,
//                   children: [
//                     Text(
//                       'Hours: ${timeParts[0]}',
//                       style: const TextStyle(fontSize: 24),
//                     ),
//                     Text(
//                       'Minutes: ${timeParts[1]}',
//                       style:const TextStyle(fontSize: 24),
//                     ),
//                     Text(
//                       'Seconds: ${timeParts[2]}',
//                       style:const TextStyle(fontSize: 24),
//                     ),
//                   ],
//                 );
//               } else {
//                 return const CircularProgressIndicator();
//               }
//             },
//           ),
//         ),
//       ),
//     );
//   }
// }