import 'package:hive_flutter/hive_flutter.dart';



class ToDoDataBase {

  List toDoList = [];

  final _myBox  = Hive.box('mybox');





  // run this method if this is the 1st time ever opening this app
  void createInitialData() {
    toDoList = [
      ["Make Tutorial", false],
      ["Do Exercise", false],
    ];
  }

// load the data from database
  void loadData() {
    toDoList = _myBox.get("TODOLIST");
  }

// update the database
  void updateDataBase() {
    _myBox.put("TODOLIST", toDoList);
  }


  List getTasksByPriority(String priority) {
    return toDoList.where((task) => task[2] == priority).toList();
  }

  // Sort tasks by priority (High -> Medium -> Low)
  void sortByPriority() {
    toDoList.sort((a, b) {
      Map<String, int> priorityOrder = {"High": 0, "Medium": 1, "Low": 2};
      return priorityOrder[a[2]]!.compareTo(priorityOrder[b[2]]!);
    });
  }



}