import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'dart:math';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        // This is the theme of your application.
        //
        // Try running your application with "flutter run". You'll see the
        // application has a blue toolbar. Then, without quitting the app, try
        // changing the primarySwatch below to Colors.green and then invoke
        // "hot reload" (press "r" in the console where you ran "flutter run",
        // or simply save your changes to "hot reload" in a Flutter IDE).
        // Notice that the counter didn't reset back to zero; the application
        // is not restarted.
        scaffoldBackgroundColor: Colors.deepOrangeAccent[100],
        primarySwatch: Colors.blue,
      ),

      home: const  GuessTheNumber(),
    );
  }
}
class GuessTheNumber extends StatefulWidget {
  const GuessTheNumber({Key? key}) : super(key: key);

  @override
  State<GuessTheNumber> createState() => _GuessTheNumberState();
}

class _GuessTheNumberState extends State<GuessTheNumber> {
  @override
  final _TextController = TextEditingController();
  String usertext = "Guess the Number between 0 and 1000";
  String username= '';
  int f=0;
  int low = 0;
  int high = 1000;
  int random = Random().nextInt(1000);
  int c = 0;
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title:Text("Guess The Number"),
        centerTitle: true,
        backgroundColor: Colors.greenAccent,
      ),
      body:  Container(
          padding: const EdgeInsets.all(40.0),

          child:  Column(
            mainAxisAlignment: MainAxisAlignment.center,

            children: <Widget>[
               Text(
                   usertext,
                 style: TextStyle(
                   color: Colors.white,
                   fontSize:25,
                 ),

               ),
               TextField(
                controller:_TextController,
                decoration: InputDecoration(labelText: "Enter your number"),
                keyboardType: TextInputType.number,

              ),
                Text(" "),


                MaterialButton(
                //     disabledColor: Colors.red,
                // disabledTextColor: Colors.black,
                padding: const EdgeInsets.all(20),

                textColor: Colors.black,
                color: Colors.white,
                onPressed: () {
                  setState(() {
                    username = _TextController.text;
                    f = int.parse(username);
                    if(  f == random) {
                      c = c + 1;
                      usertext = "Your Guess is Correct and You Took $c chances";
                    }
                    else if(f> random)
                    {
                      high = f-1;
                    usertext = "Your Guess is High and guess the number between $low and $high";
                     c=c+1;
                    }
                    else
                      {
                        low = f+1;
                      usertext = "Your Guess is Low and guess the number between $low and $high";
                      c=c+1;
                      }
                  }


                  );
                },
                child :const  Text("Enter"),



              ),




            ],


          )


      ),



    );

  }
}


