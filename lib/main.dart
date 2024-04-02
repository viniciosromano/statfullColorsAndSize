import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      home: const MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  double sizeIcon = 300;
  int colorRed = 0;
  int colorGreen = 0;
  int colorBlue = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('Flutter State'),
          actions: [
            IconButton(
              icon: const Icon(Icons.remove),
              onPressed: () {
                setState(() {
                  if (sizeIcon > 50) {
                    sizeIcon -= 50;
                  }
                });
              },
            ),
            IconButton(
              icon: const Text('S'),
              onPressed: () {
                setState(() {
                  sizeIcon = 50;
                });
              },
            ),
            IconButton(
              icon: const Text('M'),
              onPressed: () {
                setState(() {
                  sizeIcon = 300;
                });
              },
            ),
            IconButton(
              icon: const Text('L'),
              onPressed: () {
                setState(() {
                  sizeIcon = 500;
                });
              },
            ),
            IconButton(
              icon: const Icon(Icons.add),
              onPressed: () {
                setState(() {
                  if (sizeIcon < 500) {
                    sizeIcon += 50;
                  }
                });
              },
            ),
          ],
        ),
        body: Column(
          children: [
            Expanded(
              child: Center(
                child: Icon(
                  Icons.lock_clock,
                  size: sizeIcon,
                  color: Color.fromARGB(255, colorRed, colorGreen, colorBlue),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
              child: sliderFunction(
                Colors.red,
                colorRed,
                (value) {
                  setState(() {
                    colorRed = value.toInt();
                  });
                },
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
              child: sliderFunction(
                Colors.green,
                colorGreen,
                (value) {
                  setState(() {
                    colorGreen = value.toInt();
                  });
                },
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
              child: sliderFunction(
                Colors.blue,
                colorBlue,
                (value) {
                  setState(() {
                    colorBlue = value.toInt();
                  });
                },
              ),
            ),
          ],
        ));
  }

  Row sliderFunction(
      Color color, int colorValue, void Function(double x) setStateColor) {
    return Row(
      children: [
        Expanded(
          child: Slider(
              activeColor: color,
              value: colorValue.toDouble(),
              min: 0,
              max: 255,
              onChanged: setStateColor),
        ),
        Text(
          colorRed.toString(),
          style: TextStyle(
              color: color, fontWeight: FontWeight.bold, fontSize: 20),
        ),
      ],
    );
  }
}
