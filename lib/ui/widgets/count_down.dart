import 'package:flutter/material.dart';

class CountDown extends AnimatedWidget {
  CountDown({Key key, this.animation}) : super(key: key, listenable: animation);
  final Animation<int> animation;

  @override
  build(BuildContext context) {
    Duration clockTimer = Duration(seconds: animation.value);
    String timerText =
        '${clockTimer.inHours.remainder(24)}'
        ':${clockTimer.inMinutes.remainder(60).toString()}'
        // ':${clockTimer.inSeconds.remainder(60).toString().padLeft(2, '0')}';
    // print('animation.value  ${animation.value} ');
    // print('inMinutes ${clockTimer.inMinutes.toString()}');
    // print('inSeconds ${clockTimer.inSeconds.toString()}');
    // print('inSeconds.remainder ${clockTimer.inSeconds.remainder(60).toString()}');
    return Text(
      "$timerText",
      style: TextStyle(
        fontSize: 60,
        color: Theme.of(context).primaryColor,
      ),
    );
  }
}