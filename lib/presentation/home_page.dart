import 'package:flutter/material.dart';
import 'package:flutter_tests/presentation/animation_screen.dart';
import 'package:flutter_tests/presentation/counter_screen.dart';
import 'package:flutter_tests/presentation/user_screen.dart';
import 'package:flutter_tests/user_repository.dart';
import 'package:http/http.dart';

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Container(
        padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 16.0),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              SizedBox(
                width: MediaQuery.of(context).size.width,
                child: TextButton(
                  style: TextButton.styleFrom(
                    foregroundColor: Colors.white,
                    backgroundColor: Colors.blue,
                    padding: const EdgeInsets.all(16.0),
                    textStyle: const TextStyle(fontSize: 20),
                  ),
                  onPressed: () {
                    Navigator.of(context).push(MaterialPageRoute(
                        builder: (context) => const CounterScreen()));
                  },
                  child: const Text("Counter"),
                ),
              ),
              const SizedBox(height: 16.0),
              SizedBox(
                  width: MediaQuery.of(context).size.width,
                  child: TextButton(
                    style: TextButton.styleFrom(
                      foregroundColor: Colors.white,
                      backgroundColor: Colors.blue,
                      padding: const EdgeInsets.all(16.0),
                      textStyle: const TextStyle(fontSize: 20),
                    ),
                    onPressed: () {
                      Navigator.of(context).push(MaterialPageRoute(
                          builder: (context) => UserScreen(
                                futureUsers: UserRepository(client: Client())
                                    .fetchUsers(),
                              )));
                    },
                    child: const Text("Users"),
                  )),
              const SizedBox(height: 16.0),
              SizedBox(
                  width: MediaQuery.of(context).size.width,
                  child: TextButton(
                    style: TextButton.styleFrom(
                      foregroundColor: Colors.white,
                      backgroundColor: Colors.blue,
                      padding: const EdgeInsets.all(16.0),
                      textStyle: const TextStyle(fontSize: 20),
                    ),
                    onPressed: () {
                      Navigator.of(context).push(MaterialPageRoute(
                          builder: (context) => const AnimationScreen()));
                    },
                    child: const Text("Animations"),
                  )),
            ],
          ),
        ),
      ),
    );
  }
}
