import 'package:flutter/material.dart';


class ToDoListTile extends StatelessWidget {
  final String task;
  final List todo;
  final Widget remove;
  final Widget edit;
  final bool complete;

  const ToDoListTile({
    super.key,
    required this.task,
    required this.todo,
    required this.remove,
    required this.edit,
    required this.complete,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(
        top: 5,
        left: 10,
        right: 10
      ),

      child: Container(
        padding: EdgeInsets.all(15),
        decoration: BoxDecoration(
          color: Colors.blue
        ),

        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [

            Row(
              children: [
                Checkbox(value: complete, onChanged: (tre){},),
                const SizedBox(width: 1,),
                Text(
                  task,
                ),
              ],
            ),
            Column(
              children: [
                edit,
                remove
              ],
            )
          ],
        ),
      ),
    );
  }
}