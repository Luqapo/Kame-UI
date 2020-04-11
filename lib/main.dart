import 'dart:io';
import 'package:flutter/material.dart';

void main() async {
  Socket sock;
  try {
    sock = await Socket.connect('10.0.2.2', 6969);
  } catch(err) {
    print('Caught error: $err');
  }
  runApp(MyApp(sock));
}

class MyApp extends StatelessWidget {
  const MyApp(this.socket);
  final Socket socket;
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Kame controller',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: MyHomePage(title: 'Kame controll app', channel: socket),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key key, this.title, this.channel}) : super(key: key);
  final String title;
  final Socket channel;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {

  void _sendMessage(String message) {
    widget.channel.write('$message');
  }

  @override
  void dispose() {
    widget.channel.close();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
        centerTitle: true,
        backgroundColor: Colors.blue[500],
      ),
      body: Container(
        padding: EdgeInsets.only(top: 50.0),
        decoration: BoxDecoration(color: Colors.grey[300]),
        child: Column(
          children: <Widget>[
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                IconButton(
                  onPressed: () => _sendMessage('1+'),
                  icon: Icon(Icons.keyboard_arrow_up),
                  iconSize:100,
                  color: Colors.green[800],
                ),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: <Widget>[
                IconButton(
                  onPressed: () => _sendMessage('3+'),
                  icon: Icon(Icons.keyboard_arrow_left),
                  iconSize: 100,
                  color: Colors.blue[600],
                  ),
                IconButton(
                  onPressed: () => _sendMessage('5+'),
                  icon: Icon(Icons.stop),
                  iconSize: 80,
                  color: Colors.red[600],
                ),
                IconButton(
                  onPressed: () => _sendMessage('4+'),
                  icon: Icon(Icons.keyboard_arrow_right),
                  iconSize: 100,
                  color: Colors.blue[600],
                  ),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: <Widget>[
                RaisedButton(
                  onPressed: () => _sendMessage('6+'),
                  child: Text('Heart'),
                  color: Colors.blue[600],
                  ),
                RaisedButton(
                  onPressed: () => _sendMessage('7+'),
                  child: Text('Fire'),
                  color: Colors.red[600],
                ),
                RaisedButton(
                  onPressed: () => _sendMessage('8+'),
                  child: Text('Skull'),
                  color: Colors.blue[600],
                  ),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: <Widget>[
                RaisedButton(
                  onPressed: () => _sendMessage('9+'),
                  child: Text('Hello'),
                  color: Colors.blue[600],
                  ),
                RaisedButton(
                  onPressed: () => _sendMessage('10+'),
                  child: Text('Punch'),
                  color: Colors.red[600],
                ),
                RaisedButton(
                  onPressed: () => _sendMessage('11+'),
                  child: Text('Dance'),
                  color: Colors.blue[600],
                  ),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.end,
              children: <Widget>[
                IconButton(
                  onPressed: () => _sendMessage('1+'),
                  icon: Icon(Icons.home),
                  iconSize:80,
                  color: Colors.green[800],
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
