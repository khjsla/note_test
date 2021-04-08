import 'package:flutter/material.dart';
import 'package:firebase_messaging/firebase_messaging.dart';

class FireBase_Messaging extends StatefulWidget {
  @override
  _FireBase_MessagingState createState() => _FireBase_MessagingState();
}

//created a stateful widget
class _FireBase_MessagingState extends State<FireBase_Messaging> {
  final FirebaseMessaging _fc = FirebaseMessaging();
  //and initialize a FirebaseMessaging const called _fc.

  @override
  void initState() {
    // TODO: implement initState
    super.initState();

    subscribeToEvent(); //add 2
    configureCallbacks(); //add 1
  }

  @override
  Widget build(BuildContext context) {
    return Container();
  }

  void subscribeToEvent() {
    _fc.subscribeToTopic("Events");
  }

  void configureCallbacks() {
    _fc.configure(
      onMessage: (message) async {
        showDialog(
            context: context,
            builder: (context) => AlertDialog(
                  content: ListTile(
                    subtitle: Text('onMessage'),
                  ),
                  actions: [
                    FlatButton(
                        onPressed: () => Navigator.of(context).pop(),
                        child: Text('OK'))
                  ],
                ));
      },
      onResume: (message) async {
        showDialog(
            context: context,
            builder: (context) => AlertDialog(
                  content: ListTile(
                    subtitle: Text('onResume'),
                  ),
                  actions: [
                    FlatButton(
                        onPressed: () => Navigator.of(context).pop(),
                        child: Text('OK'))
                  ],
                ));
      },
      onLaunch: (message) async {
        showDialog(
            context: context,
            builder: (context) => AlertDialog(
                  content: ListTile(
                    subtitle: Text('onLaunch'),
                  ),
                  actions: [
                    FlatButton(
                        onPressed: () => Navigator.of(context).pop(),
                        child: Text('OK'))
                  ],
                ));
      },
    );
  }
}
