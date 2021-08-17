import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';


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
    return Scaffold(
      appBar: AppBar(
        title: Text('For User Input'),
        backgroundColor: Colors.blue,
      ),
      body: Column(
        children: [
          Container(
            child: Image(image: AssetImage('images/hngi.jpg')),
          ),
          Padding(
            padding: const EdgeInsets.all(15),
            child: TextField(
              decoration: InputDecoration(labelText: 'Enter Your Name',
              border: OutlineInputBorder()),

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
          Center(child: InkWell(
            child: Padding(
              padding: const EdgeInsets.all(100.0),
              child: Text('HNG Website', style: TextStyle(
                fontSize: 30.0,
                color: Colors.blue
              ),),
            ),
            onTap: () => launch('https://hng.tech/'),
          )
          )
        ],
      ),
    );
  }
}
