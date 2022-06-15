import 'package:flutter/material.dart';

class InheritedWidgetTest2 extends StatelessWidget {
  const InheritedWidgetTest2({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key, this.title}) : super(key: key);
  final String? title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _counter = 0;
  void _incrementCounter() {
    setState(() {
      _counter++;
    });
  }

  @override
  Widget build(BuildContext context) {
    return MyInheritedWidget(
      message: "I am InheritedWidget",
      counter: "$_counter",
      child: Scaffold(
        appBar: AppBar(
          title: Text(widget.title!),
        ),
        //階層を深くしても直接アクセスができることを説明したいだけの実質ダミーのWidget
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                child: Center(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: const [WidgetA()],
                      ),
                    ],
                  ),
                ),
              )
            ],
          ),
        ),
        floatingActionButton: FloatingActionButton(
          onPressed: _incrementCounter,
          tooltip: 'Increment',
          child: Icon(Icons.add),
        ),
      ),

    );
  }
}

class MyInheritedWidget extends InheritedWidget {
  final String message;
  final String counter;
  // コンストラクタでメッセージと子Widgetを取る
  MyInheritedWidget({required this.message,required this.counter, required Widget child}) : super(child: child);

  //O(1)でInheritedWidgetを返却
  static MyInheritedWidget of(BuildContext context) =>
      context.dependOnInheritedWidgetOfExactType<MyInheritedWidget>() as MyInheritedWidget;
  //更新されたかどうかの判定ロジック
  @override
  bool updateShouldNotify(MyInheritedWidget oldWidget) {
    return oldWidget.message != message || oldWidget.counter != counter ? true : false;
  }
}

class WidgetA extends StatelessWidget {
  const WidgetA({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    MyInheritedWidget _myInheritedWidget = MyInheritedWidget.of(context);
    String message = _myInheritedWidget.message;
    String counter = _myInheritedWidget.counter;
    return Text("$message : $counter");
  }
}

