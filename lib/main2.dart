import 'package:flutter/material.dart';

class Todo {
  final String title;
  final String description;

  Todo({ required this.title, required this.description })
  : assert(title != null),
    assert(description != null);
}

class main2MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Navigation',
      theme: ThemeData(
        primarySwatch: Colors.amber,
        scaffoldBackgroundColor: Colors.grey
      ),
      home: TodoScreen(
        key: null,
        todos: List<Todo>.generate(20, (i) => Todo(
          title: 'TODO $i',
          description: 'TODO $i の詳細',
        )),
      ),
    );
  }
}

class TodoScreen extends StatelessWidget {
  final List<Todo> _todos;

  const TodoScreen({Key? key, required List<Todo> todos})
      : assert(todos != null),
        this._todos = todos,
        super(key: key);

  @override
  Widget build(BuildContext context) => Scaffold(
    appBar :AppBar(
      title: Text('TODOリスト'),
    ),
    body:
        Card(
          //color: Colors.green,
          child:ListView.builder(
            itemCount: _todos.length,
            //padding: const EdgeInsets.all(10.0),

            //itemExtent: 100, //高さ
            itemBuilder: (context, index) => ListTile(
              leading: const Icon(Icons.people),
              title: Text(_todos[index].title),
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => DetailScreen(todo: _todos[index]),
                  ),
                );
              }
            ),
          ),
        ),
  );
}

class DetailScreen extends StatelessWidget {
  final Todo _todo;

  DetailScreen({Key? key, required Todo todo})
    :assert(todo != null),
     this._todo = todo,
     super(key: key);

  @override
  Widget build(BuildContext context) => Scaffold(
    appBar: AppBar(
      title: Text(_todo.title),
    ),
    body: Padding(
      padding: EdgeInsets.all(16.0),
      child: Text(_todo.description),
    ),
  );
}