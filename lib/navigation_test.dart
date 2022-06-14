

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class NavigationPage extends StatelessWidget {
  const NavigationPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Navigation',
      theme: ThemeData(
        primaryColor: Colors.deepOrange
      ),
      home: HomePage()
    );
  }
}

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      appBar: AppBar(
        title: const Text("ホーム"),
      ),
      body: Center(
        child: TextButton(
          child: const Text("1ページ目に遷移する"),
          onPressed: () {
            Navigator.push(
                context, PageRouteBuilder(
              pageBuilder:(context, animation, secondaryAnimation){
                return FirstPage();
              },
              transitionsBuilder: (context, animation, secondaryAnimation, child) {
                const Offset begin = Offset(1.0, 0.0); //右から左
                //final Offset begin = Offset(-1.0, 0.0) //左から右
                const Offset end = Offset.zero;
                final Animatable<Offset> tween = Tween(begin: begin, end: end).chain(CurveTween(curve: Curves.easeInOut));
                final Animation<Offset> offsetAnimation = animation.drive(tween);
                return SlideTransition(
                  position: offsetAnimation,
                  child: child,
                );
              }
            ));
          },
        ),
      ),
    );
  }
}

class FirstPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("ページ(1)")
      ),
      body : Center(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: <Widget>[
            TextButton(
              child: const Text("最初のページに戻る"),
              onPressed:() {
                Navigator.pop(context);
              },
            ),
            TextButton(
              child: const Text("SecondPageへ"),
              onPressed:() {
                //PushReplacementでFirstPageを削除してSecondPageを載せる
                //SecondPageのAppBarの右ボタンで最初のページに戻ることが出来る。
                Navigator.pushReplacement(
                  context,
                  MaterialPageRoute(
                    builder: (context) => SecondPage(),
                  ),
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}

class SecondPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          title: const Text("ページ(2)")
      ),
      body : Center(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: <Widget>[
            TextButton(
              child: const Text("一番最初のページに戻る"),
              onPressed:() {
                //作ったボタンで最初のページに戻る場合はpopUntil
                Navigator.popUntil(context, (route) => route.isFirst);
              },
            ),
            const Text("ColumnTest"),
          ],
        ),
      ),
    );
  }
}