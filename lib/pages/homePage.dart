import 'package:flutter/material.dart';

import '../components/ToDoListTile.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  var addController = TextEditingController();





  void openAdd() {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        content: TextField(
          controller: addController,
        ),
        actions: [
          ElevatedButton(onPressed: (){
            Navigator.of(context).pop();
          }, child: Icon(Icons.add))
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
      
      body:  ListView(
        children: [
          ToDoListTile(
            task: 'Play 7 hours straight',
          ),

          ToDoListTile(
            task: 'sleep 1 hour',
          ),



        ],
      ),
      floatingActionButton: FloatingActionButton(onPressed: openAdd, child: Icon(Icons.add),),
    );
  }
}


