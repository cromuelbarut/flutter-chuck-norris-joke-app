import 'package:flutter/material.dart';

class Button extends StatelessWidget {
  final String joke;
  final Function getJoke;
  
  const Button({
    Key? key,
    required this.joke,
    required this.getJoke,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return IconButton(
      icon: const Icon(
        Icons.arrow_forward_rounded,
        size: 30.0,
      ),
      onPressed: () => getJoke(), 
      color: Colors.black,
      highlightColor: Colors.white,
      splashRadius: 25.0,
      // child: const Text('Next joke'),

    );
  }
}