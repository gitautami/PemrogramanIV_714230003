import 'package:flutter/material.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Tempat Wisata Bandung',
      theme: ThemeData(),
      home: const DetailScreen(),
    ); // MaterialApp
  }
}

class DetailScreen extends StatelessWidget {
  const DetailScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
    body: SafeArea(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
      children: < Widget>[
        Container(
          margin: const EdgeInsets.only(top: 16.0),
          child: const Text(
            'Ranca Upas',
            textAlign: TextAlign.center,
            style: TextStyle(
              fontSize: 30.0,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),

        Container(
          margin: const EdgeInsets.symmetric(vertical: 16.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: <Widget>[
              Column(
                children: const <Widget>[
                  Icon(Icons.calendar_today),
                  SizedBox(height: 8.0),                  
                  Text('Open Everyday'),
                ],
              ),

              Column(
                children: const <Widget>[
                  Icon(Icons.access_time),
                  Text('09:00 - 20:00'),
                ],
              ),

              Column(
                children: const <Widget>[
                  Icon(Icons.monetization_on),
                  Text('Rp 20.000'),
                ],
              ),
            ],
          ),
        ),
        Container(
          padding: const EdgeInsets.all(16.0),
          child: const Text(
            'Ranca Upas adalah sebuah tempat wisata alam yang terletak di Bandung, Indonesia. Tempat ini terkenal dengan pemandangan alamnya yang indah, udara segar, dan berbagai aktivitas outdoor yang dapat dinikmati oleh pengunjung, seperti berkemah, berenang di kolam air panas, dan berinteraksi dengan rusa-rusa yang berkeliaran bebas di area tersebut.',
            textAlign: TextAlign.justify,
            style: TextStyle(
              fontSize: 16.0,
            ),
          ),
        ),
      ],
      ),
    ),
    );
  }
}