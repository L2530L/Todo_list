import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

import '../components/ToDoListTile.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  TextEditingController addController = TextEditingController();
  List<Map<String, dynamic>> todo = [
    {'task': 'Play 7 hours straight', 'taskCompleted': false},
    {
      'task': 'Sleep 1 hour',
      'taskCompleted': false,
    }
  ];

  void openAdd({int? index}) {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        content: TextField(
          controller: addController,
        ),
        actions: [
          ElevatedButton(
            onPressed: index == null
                ? () {
                    setState(() {
                      todo.add({'task': addController.text});
                    });
                    Navigator.pop(context);
                    addController.clear();
                  }
                : () {
                    setState(() {
                      todo[index]['task'] = addController.text;
                    });
                    Navigator.pop(context);
                    addController.clear();
                  },
            child: Icon(Icons.add),
          )
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('todo list'),
        backgroundColor: Colors.amber,
      ),
      body: ListView.builder(
          itemCount: todo.length,
          itemBuilder: (context, index) {
            return ToDoListTile(
              task: todo[index]['task'],
              todo: todo,
              edit: IconButton(
                  onPressed: () => openAdd(index: index),
                  icon: Icon(Icons.edit)),
              remove: IconButton(
                  onPressed: () {
                    setState(() {
                      todo.remove(todo[index]);
                    });
                  },
                  icon: Icon(Icons.delete)),
              complete: todo[index]['taskCompleted'],
            );
          }),
      floatingActionButton: FloatingActionButton(
        onPressed: openAdd,
        child: Icon(Icons.add),
      ),
    );
  }
}
