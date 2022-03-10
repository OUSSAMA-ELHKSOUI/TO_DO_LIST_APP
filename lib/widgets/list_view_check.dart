import 'package:flutter/material.dart';
import 'package:Todoey/data.dart';
import 'package:provider/provider.dart';

class ListViewCheck extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Consumer<Data>(
      builder: (context, data, child) {
        data.getTasks();
        return ListView.builder(
          itemBuilder: (context, index) {
            return GestureDetector(
              onLongPress: () {
                data.deleteTask(index);
              },
              child: CheckboxListTileStateLess(
                task: data.tasks[index].name,
                triggerCheckbox: data.tasks[index].isChecked,
                changeTriggerCheckbox: (newValue) {
                  data.changeInTask(data.tasks[index]);
                },
              ),
            );
          },
          itemCount: data.tasks.length,
        );
      },
    );
  }
}

class CheckboxListTileStateLess extends StatelessWidget {
  CheckboxListTileStateLess(
      {this.triggerCheckbox, this.changeTriggerCheckbox, this.task});
  final bool triggerCheckbox;
  final String task;
  final Function changeTriggerCheckbox;

  @override
  Widget build(BuildContext context) {
    return CheckboxListTile(
      title: Text(
        task,
        style: TextStyle(
            decoration: triggerCheckbox ? TextDecoration.lineThrough : null),
      ),
      value: triggerCheckbox,
      onChanged: changeTriggerCheckbox,
    );
  }
}
