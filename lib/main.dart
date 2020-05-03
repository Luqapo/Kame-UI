import 'dart:io';
import 'package:flutter/material.dart';

void main() async {
  Socket sock;
  try {
    sock = await Socket.connect('192.168.4.1', 80);
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
      body: Container(
        padding: const EdgeInsets.only(top: 25.0),
        decoration: BoxDecoration(
          image: DecorationImage(
            image: const AssetImage('assets/images/background_2.jpg'),
            colorFilter: ColorFilter.mode(
              Colors.black.withOpacity(0.1),
              BlendMode.softLight,
              ),
            fit: BoxFit.fill
            ),
          ),
        child: Column(
          mainAxisSize: MainAxisSize.max,
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Expanded( child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                RaisedButton(
                  onPressed: () => _sendMessage('1+'),
                  elevation:9.0,
                  shape: CircleBorder(
                    side: BorderSide(
                      color: Colors.grey[800],
                      ),
                    ),
                  child: Icon(
                      Icons.keyboard_arrow_up,
                      size:80,
                      color: Colors.greenAccent[400],
                  ),
                  color: Colors.black.withOpacity(0.45),
                  splashColor: Colors.blue[400].withOpacity(0.45),
                ),
                RaisedButton(
                  onPressed: () => _sendMessage('2+'),
                  elevation:9.0,
                  shape: CircleBorder(
                    side: BorderSide(
                      color: Colors.grey[800],
                      ),
                    ),
                  child: Icon(
                      Icons.arrow_upward,
                      size:80,
                      color: Colors.greenAccent[400],
                  ),
                  color: Colors.black.withOpacity(0.45),
                  splashColor: Colors.blue[400].withOpacity(0.45),
                ),
              ],
            )),
            Expanded( child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: <Widget>[
                RaisedButton(
                  onPressed: () => _sendMessage('3+'),
                  elevation:9.0,
                  shape: CircleBorder(
                    side: BorderSide(color: Colors.grey[800]),
                    ),
                  child: Icon(
                    Icons.keyboard_arrow_left,
                    size:80,
                    color: Colors.greenAccent[400],
                  ),
                  color: Colors.black.withOpacity(0.45),
                  splashColor: Colors.blue[400].withOpacity(0.45),
                ),
                RaisedButton(
                  onPressed: () => _sendMessage('5+'),
                  padding: const EdgeInsets.all(6.0),
                  elevation:9.0,
                  shape: CircleBorder(
                    side: BorderSide(
                      color: Colors.grey[800],
                    ),
                  ),
                  child: Icon(
                    Icons.stop,
                    size:70,
                    color: Colors.red[600],
                  ),
                  color: Colors.black.withOpacity(0.45),
                  splashColor: Colors.blue[400].withOpacity(0.45),
                ),
                RaisedButton(
                  onPressed: () => _sendMessage('4+'),
                  elevation:9.0,
                  shape: CircleBorder(
                    side: BorderSide(
                      color: Colors.grey[800],
                    ),
                  ),
                  child: Icon(
                    Icons.keyboard_arrow_right,
                    size:80,
                    color: Colors.greenAccent[400],
                  ),
                  color: Colors.black.withOpacity(0.45),
                  splashColor: Colors.blue[400].withOpacity(0.45),
                ),
              ],
            )),
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
                    'Pushup',
                    style: TextStyle(
                      fontSize: 23,
                      color: Colors.orange[300],
                      ),
                    ),
                  color: Colors.black.withOpacity(0.45),
                  splashColor: Colors.blue[400].withOpacity(0.45),
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
                    'Updown',
                    style: TextStyle(
                      fontSize: 23,
                      color: Colors.orange[300],
                      ),
                    ),
                  color: Colors.black.withOpacity(0.45),
                  splashColor: Colors.blue[400].withOpacity(0.45),
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
                    'Jump',
                    style: TextStyle(
                      fontSize: 23,
                      color: Colors.orange[300],
                      ),
                    ),
                  color: Colors.black.withOpacity(0.45),
                  splashColor: Colors.blue[400].withOpacity(0.45),
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
                      color: Colors.orange[300],
                      ),
                    ),
                  color: Colors.black.withOpacity(0.45),
                  splashColor: Colors.blue[400].withOpacity(0.45),
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
                    'Frontback',
                    style: TextStyle(
                      fontSize: 23,
                      color: Colors.orange[300],
                      ),
                    ),
                  color: Colors.black.withOpacity(0.45),
                  splashColor: Colors.blue[400].withOpacity(0.45),
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
                      fontSize: 23,
                      color: Colors.orange[300],
                      ),
                    ),
                  color: Colors.black.withOpacity(0.45),
                  splashColor: Colors.blue[400].withOpacity(0.45),
                  ),
              ],
            )),
            Expanded( child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: <Widget>[
                RaisedButton(
                  onPressed: () => _sendMessage('12+'),
                  padding: const EdgeInsets.all(20.0),
                  elevation:9.0,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(45),
                    side: BorderSide(
                      color: Colors.grey[800],
                    ),
                  ),
                  child: Text(
                    'Moonwalk',
                    style: TextStyle(
                      fontSize: 15,
                      color: Colors.orange[300],
                      ),
                    ),
                  color: Colors.black.withOpacity(0.45),
                  splashColor: Colors.blue[400].withOpacity(0.45),
                  ),
                RaisedButton(
                  onPressed: () => _sendMessage('15+'),
                  padding: const EdgeInsets.all(20.0),
                  elevation:9.0,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(45),
                    side: BorderSide(
                      color: Colors.grey[800],
                    ),
                  ),
                  child: Text(
                    'Omniwalk R',
                    style: TextStyle(
                      fontSize: 15,
                      color: Colors.orange[300],
                      ),
                    ),
                  color: Colors.black.withOpacity(0.45),
                  splashColor: Colors.blue[400].withOpacity(0.45),
                ),
                RaisedButton(
                  onPressed: () => _sendMessage('16+'),
                  padding: const EdgeInsets.all(20.0),
                  elevation:9.0,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(45),
                    side: BorderSide(
                      color: Colors.grey[800],
                      ),
                ),
                  child: Text(
                    'Omniwalk L',
                    style: TextStyle(
                      fontSize: 15,
                      color: Colors.orange[300],
                      ),
                    ),
                  color: Colors.black.withOpacity(0.45),
                  splashColor: Colors.blue[400].withOpacity(0.45),
                  ),
              ],
            )),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              crossAxisAlignment: CrossAxisAlignment.end,
              children: <Widget>[
                RaisedButton(
                  onPressed: () => _sendMessage('13+'),
                  padding: const EdgeInsets.all(20.0),
                  elevation:9.0,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(45),
                    side: BorderSide(
                      color: Colors.grey[800],
                    ),
                  ),
                  child: Text(
                    'Zero',
                    style: TextStyle(
                      fontSize: 23,
                      color: Colors.orange[300],
                      ),
                    ),
                  color: Colors.black.withOpacity(0.45),
                  splashColor: Colors.blue[400].withOpacity(0.45),
                ),
                RaisedButton(
                  onPressed: () => _sendMessage('19+'),
                  padding: const EdgeInsets.all(15.0),
                  elevation:9.0,
                  shape: CircleBorder(
                    side: BorderSide(
                      color: Colors.grey[800],
                      ),
                    ),
                  child: Icon(
                      Icons.home,
                      size:50,
                      color: Colors.yellow[800],
                  ),
                  color: Colors.black.withOpacity(0.45),
                  splashColor: Colors.blue[400].withOpacity(0.45),
                ),
                RaisedButton(
                  onPressed: () => _sendMessage('14+'),
                  padding: const EdgeInsets.all(20.0),
                  elevation:9.0,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(45),
                    side: BorderSide(
                      color: Colors.grey[800],
                    ),
                  ),
                  child: Text(
                    'Init',
                    style: TextStyle(
                      fontSize: 23,
                      color: Colors.orange[300],
                      ),
                    ),
                  color: Colors.black.withOpacity(0.45),
                  splashColor: Colors.blue[400].withOpacity(0.45),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
