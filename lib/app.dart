import 'package:flutter/material.dart';
import 'dart:convert';
import 'package:http/http.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:flutter_assignment/joke.dart';

class App extends StatefulWidget {
  const App({ Key? key }) : super(key: key);

  @override
  _AppState createState() => _AppState();
}

class _AppState extends State<App> {
  bool loading = false;
  String joke = '';
  
  Future<void> getJoke() async {
    try{
      setState(() => loading = true);

      Uri uri = Uri.parse('https://api.chucknorris.io/jokes/random');
      Response response = await get(uri);
      Map data = jsonDecode(response.body);

      setState(() {
        loading = false;
        joke = data['value'];
      });
    } catch(e) {
      setState(() => loading = false);
      // ignore: avoid_print
      print(e);
    }
  }

  @override
  void initState() {
    super.initState();
    getJoke();
  }
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.amberAccent[100],
      appBar: AppBar(
        title: const Text('Chuck Norris Jokes'),
        centerTitle: true,
        backgroundColor: Colors.amberAccent,
        foregroundColor: Colors.grey[900],
      ),
      body: Center(
        child: loading ? SpinKitWave(
            color: Colors.grey[900],
            size: 60.0,
          ) : Joke(
            joke: joke,
            getJoke: getJoke,
          ),
      ),
    );
  }
}