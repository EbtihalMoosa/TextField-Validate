import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return HomeScreen();
  }
}

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  var _key = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: SafeArea(
        child: Scaffold(
          body: Form(
            key: _key,
            child: Container(
                margin: EdgeInsets.all(20),
                child: Column(children: [
                  TextFormField(
                    validator: (value) {
                      if (value!.isEmpty || value == null) {
                        return "Email can't be empty";
                      } else if (!RegExp(
                              r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+")
                          .hasMatch(value)) {
                        return "Incorrect Email, Try Again";
                      }
                    },
                    decoration: InputDecoration(labelText: "EMAIL"),
                  ),
                  ElevatedButton(
                      onPressed: () {
                        _key.currentState!.validate();
                      },
                      child: const Text("Forget password"))
                ])),
          ),
        ),
      ),
    );
  }
}
