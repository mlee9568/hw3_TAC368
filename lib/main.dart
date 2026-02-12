// Hw 3
//Michelle Lee
import 'package:flutter/material.dart';
import 'dart:math';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Lights Out',
      home: Lab4Home(),
    );
  }
}

class Lab4Home extends StatefulWidget {
  @override
  State<Lab4Home> createState() => Lab4HomeState();
}

class Lab4HomeState extends State<Lab4Home> {
  int n = 9;
  List<bool> l = [];
  Random r = Random();

  Lab4HomeState() {
    for (int i = 0; i < n; i++) {
      l.add(r.nextBool());
    }
  }

  @override
  Widget build(BuildContext context) {
    Row boxes = Row(children: []);
    for (int i = 0; i < n; i++) {
      boxes.children.add(
        Container(
          height: 100,
          width: 100,
          color: l[i] ? Colors.yellow : Colors.brown,
          child: TextButton(
            onPressed: () {
              setState(() {
                l[i] = !l[i];
                if (i > 0) l[i - 1] = !l[i - 1];
                if (i < n - 1) l[i + 1] = !l[i + 1];
              });
            },
            child: Text(''),
          ),
        ),
      );
    }

    return Scaffold(
      appBar: AppBar(title: Text('Lights Out - Michelle')),
      body: Column(
        children: [
          boxes,
          Row(
            children: [
              ElevatedButton(
                onPressed: () {
                  setState(() {
                    n--;
                    l.clear();
                    for (int i = 0; i < n; i++) {
                      l.add(r.nextBool());
                    }
                  });
                },
                child: Text("-"),
              ),
              Text('$n'),
              ElevatedButton(
                onPressed: () {
                  setState(() {
                    n++;
                    l.clear();
                    for (int i = 0; i < n; i++) {
                      l.add(r.nextBool());
                    }
                  });
                },
                child: Text("+"),
              ),
            ],
          ),
        ],
      ),
    );
  }
}