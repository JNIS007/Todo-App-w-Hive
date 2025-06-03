import 'package:flutter/material.dart';

class PriorityIndicator extends StatelessWidget {
  final String priority;

  const PriorityIndicator({Key? key, required this.priority}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Color getColor() {
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

    IconData getIcon() {
      switch (priority.toLowerCase()) {
        case 'high':
          return Icons.keyboard_double_arrow_up;
        case 'medium':
          return Icons.keyboard_arrow_up;
        case 'low':
          return Icons.keyboard_arrow_down;
        default:
          return Icons.remove;
      }
    }

    return Container(
      padding: EdgeInsets.symmetric(horizontal: 8, vertical: 4),
      decoration: BoxDecoration(
        color: getColor().withOpacity(0.1),
        borderRadius: BorderRadius.circular(12),
        border: Border.all(color: getColor(), width: 1),
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Icon(
            getIcon(),
            size: 14,
            color: getColor(),
          ),
          SizedBox(width: 4),
          Text(
            priority.toUpperCase(),
            style: TextStyle(
              color: getColor(),
              fontSize: 10,
              fontWeight: FontWeight.bold,
            ),
          ),
        ],
      ),
    );
  }
}