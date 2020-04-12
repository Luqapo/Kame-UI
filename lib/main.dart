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
        padding: const EdgeInsets.only(top: 50.0),
        decoration: BoxDecoration(
          image: DecorationImage(
            image: const AssetImage('assets/images/background_1.jpeg'),
            colorFilter: ColorFilter.mode(
              Colors.green.withOpacity(0.7),
              BlendMode.softLight,
              ),
            fit: BoxFit.fill
            ),
          ),
        child: Column(
          mainAxisSize: MainAxisSize.max,
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                RaisedButton(
                  onPressed: () => _sendMessage('1+'),
                  padding: const EdgeInsets.all(8.0),
                  elevation:9.0,
                  shape: CircleBorder(
                    side: BorderSide(
                      color: Colors.grey[800],
                      ),
                    ),
                  child: Icon(
                      Icons.keyboard_arrow_up,
                      size:100,
                      color: Colors.green[800],
                  ),
                  color: Colors.black.withOpacity(0.25),
                ),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: <Widget>[
                RaisedButton(
                  onPressed: () => _sendMessage('3+'),
                  padding: const EdgeInsets.all(8.0),
                  elevation:9.0,
                  shape: CircleBorder(
                    side: BorderSide(color: Colors.grey[800]),
                    ),
                  child: Icon(
                    Icons.keyboard_arrow_left,
                    size:100,
                    color: Colors.blue[600],
                  ),
                  color: Colors.black.withOpacity(0.25),
                ),
                RaisedButton(
                  onPressed: () => _sendMessage('5+'),
                  padding: const EdgeInsets.all(8.0),
                  elevation:9.0,
                  shape: CircleBorder(
                    side: BorderSide(
                      color: Colors.grey[800],
                    ),
                  ),
                  child: Icon(
                    Icons.stop,
                    size:100,
                    color: Colors.red[600],
                  ),
                  color: Colors.black.withOpacity(0.25),
                ),
                RaisedButton(
                  onPressed: () => _sendMessage('4+'),
                  padding: const EdgeInsets.all(8.0),
                  elevation:9.0,
                  shape: CircleBorder(
                    side: BorderSide(
                      color: Colors.grey[800],
                    ),
                  ),
                  child: Icon(
                    Icons.keyboard_arrow_right,
                    size:100,
                    color: Colors.blue[600],
                  ),
                  color: Colors.black.withOpacity(0.25),
                ),
              ],
            ),
            Expanded( child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: <Widget>[
                RaisedButton(
                  onPressed: () => _sendMessage('6+'),
                  padding: const EdgeInsets.all(20.0),
                  elevation:9.0,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(45),
                    side: BorderSide(
                      color: Colors.grey[800],
                    ),
                  ),
                  child: Text(
                    'Heart',
                    style: TextStyle(
                      fontSize: 23,
                      color: Colors.blue,
                      ),
                    ),
                  color: Colors.black.withOpacity(0.25),
                  ),
                RaisedButton(
                  onPressed: () => _sendMessage('7+'),
                  padding: const EdgeInsets.all(20.0),
                  elevation:9.0,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(45),
                    side: BorderSide(
                      color: Colors.grey[800],
                    ),
                  ),
                  child: Text(
                    'Fire',
                    style: TextStyle(
                      fontSize: 23,
                      color: Colors.blue,
                      ),
                    ),
                  color: Colors.black.withOpacity(0.25),
                ),
                RaisedButton(
                  onPressed: () => _sendMessage('8+'),
                  padding: const EdgeInsets.all(20.0),
                  elevation:9.0,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(45),
                    side: BorderSide(
                      color: Colors.grey[800],
                    ),
                  ),
                  child: Text(
                    'Skull',
                    style: TextStyle(
                      fontSize: 23,
                      color: Colors.blue,
                      ),
                    ),
                  color: Colors.black.withOpacity(0.25),
                  ),
              ],
            )),
            Expanded( child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: <Widget>[
                RaisedButton(
                  onPressed: () => _sendMessage('9+'),
                  padding: const EdgeInsets.all(20.0),
                  elevation:9.0,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(45),
                    side: BorderSide(
                      color: Colors.grey[800],
                    ),
                  ),
                  child: Text(
                    'Hello',
                    style: TextStyle(
                      fontSize: 23,
                      color: Colors.blue,
                      ),
                    ),
                  color: Colors.black.withOpacity(0.25),
                  ),
                RaisedButton(
                  onPressed: () => _sendMessage('10+'),
                  padding: const EdgeInsets.all(20.0),
                  elevation:9.0,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(45),
                    side: BorderSide(
                      color: Colors.grey[800],
                    ),
                  ),
                  child: Text(
                    'Punch',
                    style: TextStyle(
                      fontSize: 23,
                      color: Colors.blue,
                      ),
                    ),
                  color: Colors.black.withOpacity(0.25),
                ),
                RaisedButton(
                  onPressed: () => _sendMessage('11+'),
                  padding: const EdgeInsets.all(20.0),
                  elevation:9.0,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(45),
                    side: BorderSide(
                      color: Colors.grey[800],
                      ),
                ),
                  child: Text(
                    'Dance',
                    style: TextStyle(
                      fontSize: 23, color:
                      Colors.blue,
                      ),
                    ),
                  color: Colors.black.withOpacity(0.25),
                  ),
              ],
            )),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.end,
              children: <Widget>[
                RaisedButton(
                  onPressed: () => _sendMessage('15+'),
                  padding: const EdgeInsets.all(12.0),
                  elevation:9.0,
                  shape: CircleBorder(
                    side: BorderSide(
                      color: Colors.grey[800],
                      ),
                    ),
                  child: Icon(
                      Icons.home,
                      size:70,
                      color: Colors.yellow[800],
                  ),
                  color: Colors.black.withOpacity(0.25),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
