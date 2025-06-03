

import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';




class TodoTile extends StatelessWidget {
  final String taskName;
  final bool taskCompleted;
  Function(bool?)? onChanged;
  Function(BuildContext)? deleteFunction;
   TodoTile({
    super.key,
  required this.taskName,
    required this.taskCompleted,
    required this.onChanged,
     required this.deleteFunction
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 25, right: 25, top: 25),
      child: Slidable(
        endActionPane: ActionPane(
            motion: StretchMotion(),
            children: [
              SlidableAction(
                borderRadius: BorderRadius.circular(12),
                  onPressed: deleteFunction,
                icon: Icons.delete,
                backgroundColor: Colors.red,
              )
            ]
        ),
        child: Container(
          decoration: BoxDecoration(
              color: Colors.grey[200],
            borderRadius: BorderRadius.circular(12)
          ),
          padding: EdgeInsets.all(20),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              //task name
              Text(
                  taskName,
                style: TextStyle(
                  decoration: taskCompleted ? TextDecoration.lineThrough : TextDecoration.none
                ),
              ),
        
              //checkbox
              Checkbox(
                  value: taskCompleted,
                  onChanged: onChanged,
                activeColor: Colors.black,
                checkColor: Colors.white,
              )
            ],
          ),
        ),
      ),
    );
  }
}
