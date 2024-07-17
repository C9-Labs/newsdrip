import 'dart:developer';
import 'dart:math';
import 'package:html/parser.dart';
import 'package:flutter/material.dart';
import 'package:flutter_html/flutter_html.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:url_launcher/url_launcher.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

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
          useMaterial3: true,
          primaryColor: Colors.red,
          backgroundColor: Colors.black12),
      home: const MyHomePage(title: "Today's News Headlines"),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key, required this.title}) : super(key: key);
  // This widget is the home page of your application. It is stateful, meaning
  // that it has a State object (defined below) that contains fields that affect
  // how it looks.

  // This class is the configuration for the state. It holds the values (in this
  // case the title) provided by the parent (in this case the App widget) and
  // used by the build method of the State. Fields in a Widget subclass are
  // always marked "final".

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  void initState() {
    super.initState();
    getdata();
  }

  var _counter = 0;
  var ds;
  String _source = 'bbc';
  void getdata([String source = 'bbc']) {
    final res = http.get(Uri.parse('http://endpoint.api2.news/' + source));
    res.asStream().listen((event) {
      if (event.statusCode == 200) {
        print(jsonDecode(event.body)[0]['title']);
        setState(() {
          ds = jsonDecode(event.body);
        });
      } else {
        print('Error');
      }
    });
  }

  bool setSource(String source) {
    getdata(source);
    setState(() {
      _source = source;
      ds = null;
    });
    return true;
  }

  void _incrementCounter() {
    setState(() {
      // This call to setState tells the Flutter framework that something has
      // changed in this State, which causes it to rerun the build method below
      // so that the display can reflect the updated values. If we changed
      // _counter without calling setState(), then the build method would not be
      // called again, and so nothing would appear to happen.
      _counter++;
    });
  }

  @override
  Widget build(BuildContext context) {
    // This method is rerun every time setState is called, for instance as done
    // by the _incrementCounter method above.
    //
    // The Flutter framework has been optimized to make rerunning build methods
    // fast, so that you can just rebuild anything that needs updating rather
    // than having to individually change instances of widgets.
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        // Here we take the value from the MyHomePage object that was created by
        // the App.build method, and use it to set our appbar title.
        title: Text(widget.title),
      ),
      body: Container(
        // Center is a layout widget. It takes a single child and positions it
        // in the middle of the parent.
        child: ListView(
          padding: const EdgeInsets.all(18),
          children: <Widget>[
            Center(
              child: Text(
                '$_source'.toUpperCase(),
                style: TextStyle(color: Colors.white, fontSize: 30),
              ),
            ),
            Center(
                child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                FilterChip(
                  label: Text("BBC"),
                  onSelected: (bool value) {
                    setSource('bbc');
                  },
                  padding: const EdgeInsets.all(8),
                ),
                FilterChip(
                  label: Text("NYT"),
                  onSelected: (bool value) {
                    setSource('nyt');
                  },
                  padding: const EdgeInsets.all(8),
                ),
                FilterChip(
                  label: Text("Times Of India"),
                  onSelected: (bool value) {
                    setSource('toi');
                  },
                  padding: const EdgeInsets.all(8),
                ),
                FilterChip(
                  label: Text("TechCrunch"),
                  onSelected: (bool value) {
                    setSource('techcrunch');
                  },
                  padding: const EdgeInsets.all(8),
                ),
              ],
            )),
            Text(
              'Source: ' + _source.toUpperCase(),
              key: Key("source"),
              style: TextStyle(color: Colors.white, fontSize: 30),
            ),
            // Build a Card List
            if (ds != null)
              for (var i in ds)
                Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
                  GestureDetector(
                      onTap: () {
                        print(i['link'] == '');
                        launchUrl(new Uri(
                            scheme: 'https',
                            host: i['link'] != ''
                                ? i['link']
                                    .toString()
                                    .replaceAll("http://", "")
                                    .replaceAll("https://", "")
                                    .split("/")[0]
                                : i['id']
                                    .toString()
                                    .replaceAll("http://", "")
                                    .replaceAll("https://", "")
                                    .split("/")[0],
                            path: i['link'] != ''
                                ? i['link']
                                    .toString()
                                    .replaceAll("http://", "")
                                    .replaceAll("https://", "")
                                    .replaceAll(
                                        i['link']
                                            .toString()
                                            .replaceAll("http://", "")
                                            .replaceAll("https://", "")
                                            .split("/")[0],
                                        "")
                                    .split("#")[0]
                                : i['id']
                                    .toString()
                                    .replaceAll("http://", "")
                                    .replaceAll("https://", "")
                                    .replaceAll(
                                        i['id']
                                            .toString()
                                            .replaceAll("http://", "")
                                            .replaceAll("https://", "")
                                            .split("/")[0],
                                        "")
                                    .split("#")[0]));
                      },
                      child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(i['title'],
                                style: TextStyle(
                                  color: Colors.green,
                                  fontSize: 20,
                                )),
                            Html(
                                data: i['summary'],
                                style: {"body": Style(color: Colors.blueGrey)})
                          ]))
                ])
            else
              const LinearProgressIndicator(),

            // GET DATA BUTTON
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _incrementCounter,
        tooltip: 'Increment',
        child: const Icon(Icons.add),
      ), // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}
