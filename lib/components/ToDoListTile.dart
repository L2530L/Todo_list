import 'package:flutter/material.dart';


class ToDoListTile extends StatelessWidget {
  final String task;
  final List todo;
  final Widget remove;
  final Widget edit;
  final bool complete;
  final bool value;
  final void Function(bool?) onChanged;

  const ToDoListTile({
    super.key,
    required this.task,
    required this.todo,
    required this.remove,
    required this.edit,
    required this.complete,
    required this.value,
    required this.onChanged,
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
        padding: const EdgeInsets.all(15),
        decoration: const BoxDecoration(
          color: Colors.blue
        ),

        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [

            Row(
              children: [
                Checkbox(
                value: value,
                onChanged: onChanged,
              ),
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