

import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';




class TodoTile extends StatelessWidget {
  final String taskName;
  final bool taskCompleted;
  final String priority;
  Function(bool?)? onChanged;
  Function(BuildContext)? deleteFunction;
   TodoTile({
    super.key,
  required this.taskName,
    required this.taskCompleted,
    required this.onChanged,
     required this.deleteFunction,
     required this.priority,
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
                backgroundColor: Colors.red.shade300,
              )
            ]
        ),
        child: Container(
          decoration: BoxDecoration(
            border: Border.all(
              color: _getPriorityColor(priority).withOpacity(0.3),
              width: 2,
            ),
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
                activeColor: _getPriorityColor(priority),
                checkColor: Colors.white,
              )
            ],
          ),
        ),
      ),
    );
  }
}



Color _getPriorityColor(String priority) {
  switch (priority.toLowerCase()) {
    case 'high':
      return Colors.red;
    case 'medium':
      return Colors.orange;
    case 'low':
      return Colors.green;
    default:
      return Colors.grey;
  }
}

