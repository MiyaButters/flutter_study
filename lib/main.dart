import 'package:flutter/material.dart';
import 'package:flutter_study/inheritedwidget_test.dart';
import 'package:flutter_study/navigationbar_test.dart';
import 'package:flutter_study/single_child_scrollview.dart';
import 'package:flutter_study/swapTest.dart';
import 'package:flutter_study/widget_look.dart';
import 'package:flutter_study/widget_setState.dart';
import 'package:flutter_study/widget_setState2.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'expand_test.dart';
import 'image_container.dart';
import 'image_test.dart';
import 'main2.dart';
import 'navigation_test.dart';

void main() {
  //runApp(const ImageText());
  //runApp(const ButtomNavigationTest());
  //runApp(main2MyApp());
  //runApp(const NavigationPage());
  //runApp(const InharitedWidgetTest());
  runApp(const MyApp());
  //runApp(WidgetLookTest());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      //home: const MyHomePage(title: 'Flutter Demo Home Page'),
      //home: const swapTestPage(title: 'swapTestPage'),
      //home: const MyHomePage(title: 'MyHomePage'),
      //home: const ImageContainer(),
      //home: const TapBoxA(), //ウィジェット自身で状態を管理するパターン
      //home: const ParentWidget(), //親ウィジェットで状態を管理するパターン
      //home: const ChildScrollViewWidget(),
      home: const SetState2(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key, required this.title}) : super(key: key);
  final String title;
  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _counter = 0;
  String _prefItem = "初期値";
  String _type = "偶数";

  _getPrefItems() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    //以下の[counter]がキー名。見つからなければ0を返す
    setState(() {
      _counter = prefs.getInt('counter') ?? 0;
      _prefItem = (prefs.getInt('counter') ?? 0) as String;
    });
  }

  _setPrefItems() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setInt('counter', _counter);
    setState(() {
      _prefItem = _counter.toString();
    });
  }

  _removePrefItems() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    setState(() {
      _counter = 0;
      prefs.remove('counter');
    });
  }

  void _incrementCounter() {
    setState(() {
      _setPrefItems();
      _counter++;
      if (_counter % 2 == 0) {
        _type = "偶数";
      } else {
        _type = "奇数";
      }
    });
  }

  @override
  void initState() {
    super.initState();
    _getPrefItems(); //初期化時にSharedPreferencesに保存している値を読み込む
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Row(children: [
          Icon(Icons.create),
          Text(widget.title),
        ]),
      ),
      drawer: Drawer(child: Center(child: Text("Drawer"))),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(
              '記録された値：$_prefItem',
            ),
            Text(
              '現在の値：$_counter',
              style: Theme
                  .of(context)
                  .textTheme
                  .headline4,
            ),
            Text('$_type'),
            if (_counter % 2 == 0)
              Text('偶数です', style: TextStyle(fontSize: 20, color: Colors.red)),
            if (_counter % 2 == 1)
              Text('奇数です', style: TextStyle(fontSize: 20, color: Colors.red))
          ],
        ),
      ),
      floatingActionButton: Column(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          Align(
            child: FloatingActionButton.extended(
                onPressed: () => _removePrefItems(),
                icon: new Icon(Icons.refresh),
                label: Text("削除する")
            ),
          ),
          Align(
            alignment: Alignment.bottomRight,
            child: FloatingActionButton(
                onPressed: _incrementCounter,
                tooltip: 'Increment',
                child: Icon(Icons.add)
            ),
          ),
        ],
      ),
    );
  }
}





