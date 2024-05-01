import 'package:flutter/material.dart';

import '../components/ToDoListTile.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  TextEditingController addController = TextEditingController();
  List<Map<String, dynamic>> todo = [
    {
      'task': 'Play 7 hours straight',
      'taskCompleted': false,
    },
    {
      'task': 'Sleep 1 hour',
      'taskCompleted': false,
    },
  ];

  void openAdd({int? index}) {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        content: TextField(
          controller: addController,
          decoration: const InputDecoration(
            border: OutlineInputBorder(),
          ),
        ),
        actions: [
          ElevatedButton(
            onPressed: index == null
                ? () {
                    setState(() {
                      todo.add(
                          {'task': addController.text, 'taskCompleted': false});
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
            child: const Icon(Icons.add),
          )
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('todo list'),
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
                icon: const Icon(Icons.edit)),
            remove: IconButton(
                onPressed: () {
                  setState(() {
                    todo.remove(todo[index]);
                  });
                },
                icon: const Icon(Icons.delete)),
            complete: todo[index]['taskCompleted'],
            value: todo[index]['taskCompleted'],
            onChanged: (checked) {
              setState(
                () {
                  todo[index]['taskCompleted'] = checked;
                },
              );
            },
          );
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: openAdd,
        child: const Icon(Icons.add),
      ),
    );
  }
}
