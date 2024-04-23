import 'package:flutter/material.dart';


class ToDoListTile extends StatelessWidget {
  final String task;
  
  
  const ToDoListTile({
    super.key,
    required this.task,
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
                Checkbox(value: false, onChanged: (p0){},),
                const SizedBox(width: 1,),
                Text(
                  task,
                ),
              ],
            ),
            Column(
              children: [
                IconButton(onPressed: (){}, icon: Icon(Icons.edit)),
                IconButton(onPressed: (){}, icon: Icon(Icons.delete)),
              ],
            )
          ],
        ),
      ),
    );
  }
}