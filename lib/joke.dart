import 'package:flutter/material.dart';
import 'package:flutter_assignment/button.dart';

class Joke extends StatelessWidget {
  final String joke;
  final Function getJoke;
  
  const Joke({
    Key? key,
    required this.joke,
    required this.getJoke,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(
        vertical: 0.0,
        horizontal: 20.0
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Text(
            joke,
            style: const TextStyle(
              fontSize: 20.0,
            ),
            textAlign: TextAlign.center,
          ),
          const SizedBox(height: 25.0),
          Button(
            joke: joke,
            getJoke: getJoke,
          ),
        ],
      ),
    );
  }
}