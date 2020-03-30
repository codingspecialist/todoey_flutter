import 'package:flutter/material.dart';
import 'package:todoey_flutter/models/task.dart';
import 'package:todoey_flutter/widgets/task_tile.dart';

class TaskList extends StatefulWidget {

  //_State 에서 여기에 접근하려면 widget. 으로 접근한다.
  final List<Task> tasks;
  const TaskList({Key key, this.tasks});

  @override
  _TaskListState createState() => _TaskListState();
}

class _TaskListState extends State<TaskList> {
  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemBuilder: (context, index) {
        return TaskTile(
            taskTitle: widget.tasks[index].name,
            isChecked: widget.tasks[index].isDone,
            checkboxCallback: (newValue){
              setState(() {
                widget.tasks[index].toggleDone();
              });
            },
        );
      },
      itemCount: widget.tasks.length,
    );
  }
}
