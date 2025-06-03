import 'package:flutter/material.dart';
import 'package:todoapp/utils/my_button.dart';

class DialogBox extends StatefulWidget {
  final controller;
  final VoidCallback onSave;
  final VoidCallback onCancel;
  final Function(String) onPriorityChanged; // Add this callback

  DialogBox({
    super.key,
    required this.controller,
    required this.onSave,
    required this.onCancel,
    required this.onPriorityChanged, // Add this parameter
  });

  @override
  _DialogBoxState createState() => _DialogBoxState();
}

class _DialogBoxState extends State<DialogBox> {
  String selectedPriority = "Medium";
  final priorities = ["High", "Medium", "Low"];

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      backgroundColor: Colors.grey[200],
      content: Container(
        height: 200, // Increased height to accommodate priority selection
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            // Task input field
            TextField(
              controller: widget.controller,
              decoration: InputDecoration(
                  border: OutlineInputBorder(),
                  hintText: "Add a new task"
              ),
            ),

            // Priority selection
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "Priority:",
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 16,
                  ),
                ),
                SizedBox(height: 8),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: priorities.map((priority) {
                    bool isSelected = selectedPriority == priority;
                    Color priorityColor = _getPriorityColor(priority);

                    return GestureDetector(
                      onTap: () {
                        setState(() {
                          selectedPriority = priority;
                        });
                        widget.onPriorityChanged(priority);
                      },
                      child: Container(
                        padding: EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                        decoration: BoxDecoration(
                          color: isSelected
                              ? priorityColor.withOpacity(0.2)
                              : Colors.transparent,
                          borderRadius: BorderRadius.circular(20),
                          border: Border.all(
                            color: priorityColor,
                            width: isSelected ? 2 : 1,
                          ),
                        ),
                        child: Text(
                          priority,
                          style: TextStyle(
                            color: priorityColor,
                            fontWeight: isSelected
                                ? FontWeight.bold
                                : FontWeight.normal,
                          ),
                        ),
                      ),
                    );
                  }).toList(),
                ),
              ],
            ),

            // Buttons row
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                //save button
                MyButton(text: 'Save', onPressed: widget.onSave),

                SizedBox(width: 8,),
                //cancel button
                MyButton(text: 'Cancel', onPressed: widget.onCancel)
              ],
            )
          ],
        ),
      ),
    );
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
}