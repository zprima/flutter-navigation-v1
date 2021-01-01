import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  // This widget is the root of your application.
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  int _pageNumber = 1;

  void _handlePageNumberChange(int number) {
    setState(() {
      _pageNumber = number;
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: Page1(),
      routes: <String, WidgetBuilder>{
        '/2': (context) => Page2(),
        '/3': (context) => Page3(),
      },
    );
  }
}

class Page1 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Container(
            color: Colors.blue,
            child: Center(
              child: TextButton(
                onPressed: () {
                  Navigator.pushNamed(context, '/2');
                },
                child: Text("Page 1"),
                style: TextButton.styleFrom(primary: Colors.white),
              ),
            )),
      ),
    );
  }
}

class ScreenArguments {
  String title;

  ScreenArguments({this.title});
}

class Page2 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
        color: Colors.orange,
        child: Center(
            child: TextButton(
                onPressed: () {
                  Navigator.pushNamed(
                    context,
                    '/3',
                    arguments: ScreenArguments(title: "Mijago"),
                  );
                },
                child: Text("Page 2"))));
  }
}

class Page3 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final ScreenArguments args = ModalRoute.of(context).settings.arguments;

    return Container(
        color: Colors.green,
        child: Center(
            child: TextButton(
                onPressed: () {
                  Navigator.pop(context);
                },
                child: Text("Page 3 ${args.title}"))));
  }
}
