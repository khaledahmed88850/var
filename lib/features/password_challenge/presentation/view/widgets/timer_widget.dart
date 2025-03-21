import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_application_1/core/utils/app_text_styles.dart';

class TimerWidget extends StatefulWidget {
  const TimerWidget({super.key, required this.timer});
  final int timer;
  @override
  State<TimerWidget> createState() => _TimerWidgetState();
}

class _TimerWidgetState extends State<TimerWidget> {
  int start = 30;
  Timer? timer;

  void startTimer() {
    const oneSec = Duration(seconds: 1);
    start = widget.timer;
    if (timer == null) {
      timer = Timer.periodic(oneSec, (timer) {
        if (start == 0) {
          setState(() {
            timer.cancel();
          });
        } else {
          setState(() {
            start--;
          });
        }
      });
    } else {
      timer!.cancel();
    }
  }

  void cancelTimer() {
    if (timer == null) {
      return;
    }
    timer!.cancel();
  }

  @override
  void dispose() {
    cancelTimer();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        ElevatedButton(
          onPressed: () {
            if (start != widget.timer) {
              return;
            }
            startTimer();
          },
          child: const Icon(Icons.play_arrow_rounded, size: 40),
        ),

        Text("$start", style: Styles.bold23),
        ElevatedButton(
          style: ElevatedButton.styleFrom(backgroundColor: Colors.red),
          onPressed: () {
            setState(() {
              cancelTimer();
              start = widget.timer;
            });
            startTimer();
          },
          child: const Icon(Icons.restart_alt_outlined, size: 40),
        ),
      ],
    );
  }
}
