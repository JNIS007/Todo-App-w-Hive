import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:todoapp/data/databse.dart';
import 'package:todoapp/utils/dialog_box.dart';
import 'package:todoapp/utils/todo_tile.dart';


class Homepage extends StatefulWidget {
  const Homepage({super.key});

  @override
  State<Homepage> createState() => _HomepageState();
}

class _HomepageState extends State<Homepage> {

  //reference the hive box
  final _myBox = Hive.box('mybox');
  ToDoDataBase db = ToDoDataBase();


  @override
  void initState() {
   if(_myBox.get("TODOLIST")== null ){
     db.createInitialData();
   }else{
     db.loadData();
   }
    super.initState();
  }

  final _controller = TextEditingController();
  String selectedPriority = "Medium";




  //Checkbox tap method
  void checkBoxChanged(bool? value, int index) {
    setState(() {
      db.toDoList[index][1] = !db.toDoList[index][1];
    });
    db.updateDataBase();
  }

  //save new task

  void saveNewTask() {
    setState(() {
      db.toDoList.add([_controller.text, false, selectedPriority]);
      _controller.clear();
    });
    Navigator.of(context).pop();
    db.updateDataBase();
  }

  //create new task
  void createNewTask() {
    selectedPriority = "Medium";
    showDialog(context: context,
        builder: (context){
      return DialogBox(
          controller: _controller,
        onSave: saveNewTask,
        onCancel: ()=> Navigator.of(context).pop(),
        onPriorityChanged: (priority) {
          selectedPriority = priority;
        },
      );
        });
  }

  void deleteTask(int index) {
    setState(() {
      db.toDoList.removeAt(index);
    });
    db.updateDataBase();

  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[300],
      appBar: AppBar(
        title: Text('My TODO List', style: TextStyle(color: Colors.black),),
        centerTitle: true,


      ),
      floatingActionButton: FloatingActionButton(
          onPressed: createNewTask,
        child: Icon(Icons.add),
        backgroundColor: Colors.grey[200],
      ),
      body: ListView.builder(
        itemCount: db.toDoList.length,
          itemBuilder: (context, index) {
          return TodoTile(
              taskName: db.toDoList[index][0],
              taskCompleted: db.toDoList[index][1],
            priority: db.toDoList[index].length > 2 ? db.toDoList[index][2] : "Medium",
              onChanged: (value) => checkBoxChanged(value,index),
            deleteFunction: (context) => deleteTask(index),
          );
          }
      )


    );
  }
}
