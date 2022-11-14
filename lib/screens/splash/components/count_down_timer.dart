import 'dart:async';

import 'package:flutter/material.dart';

import '../../../uitls/theme_color.dart';
import '../../../widget/text_header1.dart';

class CountdownTimer extends StatefulWidget {
  const CountdownTimer({Key? key, required this.endCountdown}) : super(key: key);

  final ValueChanged<int> endCountdown;

  @override
  State<CountdownTimer> createState() => _CountdownTimerState();
}

class _CountdownTimerState extends State<CountdownTimer> {
  late Timer _timer;
  final oneSec = const Duration(seconds: 1);
  int _start = 10;


  @override
  void initState() {

    _timer = Timer.periodic(
      oneSec,
          (Timer timer) {
        if (_start == 0) {
          timer.cancel();
          setState(() {
          });
          widget.endCountdown(_start);
        } else {
          setState(() {
            _start--;
          });
        }
      },
    );
    super.initState();
  }

  @override
  void dispose() {
    _timer.cancel();
    super.dispose();
  }
  @override
  Widget build(BuildContext context) {
    return TextHeader1(text: _start == 0?"Let's go...":"$_start",colorText: ThemeColor.colorWhile,fontSize: 35,);
  }
}