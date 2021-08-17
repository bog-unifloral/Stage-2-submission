import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

const _url = 'https://hng.tech/';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Home(),
    );
  }
}

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  final titleController = TextEditingController();
  String text = "No Data Entered";

  void _setText() {
    setState(() {
      text = titleController.text;
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text('For User Input'),
          backgroundColor: Colors.blue,
        ),
        body: SafeArea(
            child: SingleChildScrollView(
          child: Column(
            children: [
              Image(
                image: AssetImage('images/hngi.jpg'),
              ),
              Padding(
                padding: const EdgeInsets.all(15.0),
                child: TextField(
                  decoration: InputDecoration(
                    labelText: 'Enter your name',
                    border: OutlineInputBorder(),
                  ),
                  controller: titleController,
                ),
              ),
              SizedBox(
                height: 8,
              ),
              ElevatedButton(
                onPressed: _setText,
                child: Text('Submit'),
              ),
              SizedBox(
                height: 20,
              ),
              Text(text),
              SizedBox(
                height: 100,
              ),
              TextButton(
                onPressed: () {
                  _launchURL();
                },
                child: Text('HNG internship website'),
                style: TextButton.styleFrom(
                    primary: Colors.blue, textStyle: TextStyle(fontSize: 30)),
              )
            ],
          ),
        )),
      ),
    );
  }
}

void _launchURL() async =>
    await canLaunch(_url) ? await launch(_url) : throw 'Could not launch $_url';
