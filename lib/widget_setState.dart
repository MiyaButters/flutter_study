import 'dart:ffi';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

//ウィジェット自身で状態を管理するパターン ListViewなど他のウィジェットから操作する必要のない内部的な状態はウィジェット自身で管理
class TapBoxA extends StatefulWidget {
  const TapBoxA({Key? key}) : super(key: key);
  @override
  _TapBoxAState createState() => _TapBoxAState();
}

class _TapBoxAState extends State<TapBoxA> {
  bool _active = false;

  void _handleTap() {
    setState(() {
      _active = !_active; //論理演算　_activeがtrueならfalse , falseならtrue
    });
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: _handleTap,
      child: Container(
        child: Center(
          child: Text(
            _active ? 'Active' : 'Inactive', //三項演算：(条件式)?真の場合の処理：偽の場合の処理
            style: TextStyle(fontSize: 32.0, color: Colors.white),
          ),
        ),
        width: 200.0,
        height: 200.0,
        decoration: BoxDecoration(
          color: _active ? Colors.lightGreen[700] : Colors.grey[600],
        ),
      ),
    );
  }
}


//親ウィジェットで状態を管理するパターン　多くの場合は親ウィジェットで管理、変更が必要になった時点で子ウィジェットを作り直す
class ParentWidget extends StatefulWidget {
  const ParentWidget({Key? key}) : super(key: key);

  @override
  _ParentWidgetState createState() => _ParentWidgetState();
}

class _ParentWidgetState extends State<ParentWidget> {
  bool _active = false;
  void _handleTapBoxChanged(bool newValue) {
    setState(() {
      _active = newValue;
    });
  }
  @override
  Widget build(BuildContext context) {
    return Container(
      child: TapBoxB(
        active: _active,
        onChanged: _handleTapBoxChanged,
      ),
    );
  }
}
class TapBoxB extends StatelessWidget {
  TapBoxB({ Key? key, required this.active, required this.onChanged })
  :super(key: key);

  final bool active;
  final ValueChanged<bool> onChanged;

  void _handleTap() {
    onChanged(!active);
  }
  @override
  Widget build(BuildContext context) => GestureDetector(
    onTap: _handleTap,
    child: Container(
      child: Center(
        child: Text(
          active ? 'Active' : 'Inactive',
          style: TextStyle(fontSize: 32.0, color: Colors.white),
        ),
      ),
      width: 200.0,
      height: 200.0,
      decoration: BoxDecoration(
        color: active ? Colors.lightGreen[700] : Colors.grey[600],
      ),
    ),
  );
}

//ウィジェット自身と親の両方で状態管理
// class TapBoxC extends StatefulWidget {
//   const TapBoxC({Key? key}) : super(key: key);
//   @override
//   _TapBoxCState createState() => _TapBoxCState();
// }
// class _TapBoxCState extends State<TapBoxC> {
//   bool _highlight = false;
//   @override
//   Widget build(BuildContext context) => GestureDetector(
//     onTapDown: _handleTapDown,
//     onTapUp: _handleTapUp,
//     onTapCancel: _handleTapCancel,
//     onTap: _handleTap,
//     child: Container(
//       child: Center(
//         child: Text(widget.active ? 'Active' : 'Inactive' , style: const TextStyle(
//           fontSize: 32.0,
//           color: Colors.white,
//         )),
//       ),
//       width: 200.0,
//       height: 200.0,
//       decoration: BoxDecoration(
//         color: widget.active ? Colors.lightGreen[700] : Colors.grey[600],
//         border: _highlight ? Border.all(
//           color: (Colors.teal[700])!,
//           width: 10.0,
//         ) : null,
//       ),
//     ),
//   );
//
//   void _handleTapDown(TapDownDetails details) {
//     setState(() {
//       _highlight = true;
//     });
//   }
//
//   void _handleTapUp(TapUpDetails details) {
//     setState(() {
//       _highlight = false;
//     });
//   }
//
//   void _handleTapCancel() {
//     setState(() {
//       _highlight = false;
//     });
//   }
//
//   void _handleTap() {
//     widget.onChanged(!widget.active);
//   }
// }