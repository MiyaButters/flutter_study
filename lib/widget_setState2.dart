
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class SetState2 extends StatefulWidget {
  const SetState2({Key? key}) : super(key: key);

  @override
  _SetState2State createState() => _SetState2State();
}

class _SetState2State extends State<SetState2> {
  int _count = 0;
  bool _isLoading = false;

  void _increment() async {
    setState(() {
      _isLoading = true;
    });
    Future.delayed(const Duration(seconds: 1)).then((_) {
      //setStateメソッドにより状態の変更を通知
      setState(() {
        _count++;
      });
    }).whenComplete(() {
      setState(() {
        _isLoading = false;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    print('called SetState2#build');
    return Stack(
      children: <Widget>[
        Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          //コンストラクタ経由で状態を受け渡し
          children: <Widget>[
            WidgetA(_count),
            const WidgetB(),
            WidgetC(_increment)
          ],
        ),
        LoadingWidget(_isLoading)
      ],
    );
  }
}

class WidgetA extends StatelessWidget {
  const WidgetA(this._count, {Key? key}) : super(key: key);

  final int _count;

  @override
  Widget build(BuildContext context) {
    print('called WidgetA#build');
    return Center(
      child: Text(
        '$_count',
        style: Theme.of(context).textTheme.headline4,
      )
    );
  }
}
class WidgetB extends StatelessWidget {
  const WidgetB({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    print('called WidgetB#build');
    return const Text(
      'You have pushed the button this many times:',
    );
  }
}
class WidgetC extends StatelessWidget {
  const WidgetC(this._increment, {Key? key}) : super(key: key);

  final void Function() _increment;

  @override
  Widget build(BuildContext context) {
    print('called WidgetC#build');
    return ElevatedButton(
      onPressed: () {
        _increment();
      },
      child: const Icon(Icons.add)
    );
  }
}
//疑似的読み込み中サークル表示
class LoadingWidget extends StatelessWidget {
  const LoadingWidget(this._isLoading, {Key? key}) : super(key: key);

  final bool _isLoading;

  @override
  Widget build(BuildContext context) {
    print('called LoadingWidget#huild');
    return _isLoading ? const DecoratedBox(
      decoration: BoxDecoration(color: Color(0x44000000)),
      child: Center(child: CircularProgressIndicator()))
        : const SizedBox.shrink();
  }
}




