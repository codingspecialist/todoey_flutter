import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:todoey_flutter/models/task_data.dart';
import 'package:todoey_flutter/widgets/task_tile.dart';

class TasksList extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // 이렇게 Consumer를 사용해서 builder의 중간 파라메터에서 가져올 수도 있고 아래 주석과 같이도 사용가능하다.
    // final TaskData myTaskData = Provider.of<TaskData>(context);

    // Consumer는 상태 변경이 일어날때 builder 에 지정된 위젯을 rebuild하는데
    // Consumer 는 변경될 위젯 가장 깊숙한 곳 에서 사용하는 것이 좋다.

    return Consumer<TaskData>(
      builder: (context, taskData, child) {
        return ListView.builder(
          itemBuilder: (context, index) {
            final task = taskData.tasks[index];
            return TaskTile(
              taskTitle: task.name,
              isChecked: task.isDone,
              checkboxCallback: (checkboxState) {
                taskData.updateTask(task);
              },
              longPressCallback: () {
                taskData.deleteTask(task);
              },
            );
          },
          itemCount: taskData.taskCount,
        );
      },
    );
  }
}