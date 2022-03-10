import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:Todoey/widgets/list_view_check.dart';
import 'package:Todoey/widgets/add_bottom_sheet.dart';
import 'package:provider/provider.dart';
import 'package:Todoey/data.dart';

class TodoScreen extends StatelessWidget {
  // void addToTasks(taskName) {
  //   Provider.of<Data>(context).addTask(taskName);
  //   // setState(() {
  //   //   Provider.of<Data>(context, listen: false).addTask(taskName);
  //   // });
  // }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.lightBlueAccent,
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          showModalBottomSheet(
            context: context,
            isScrollControlled: true,
            builder: (context) => SingleChildScrollView(
              child: Container(
                  padding: EdgeInsets.only(
                      bottom: MediaQuery.of(context).viewInsets.bottom),
                  child: AddBottomSheet(
                    function: (taskName) {
                      Provider.of<Data>(context, listen: false)
                          .addTask(taskName);
                    },
                  )),
            ),
          );
        },
        backgroundColor: Colors.lightBlueAccent,
        child: Icon(
          Icons.add,
          color: Colors.white,
        ),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            padding: EdgeInsets.only(top: 70.0, left: 30.0, bottom: 30.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                CircleAvatar(
                  child: Icon(
                    Icons.list,
                    size: 40.0,
                    color: Colors.lightBlueAccent,
                  ),
                  backgroundColor: Colors.white,
                  radius: 30.0,
                ),
                SizedBox(
                  height: 10.0,
                ),
                Text(
                  'Todoey',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 40.0,
                    fontWeight: FontWeight.w900,
                  ),
                ),
                Text(
                  '${Provider.of<Data>(context).tasks.length} items',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 12.0,
                  ),
                ),
              ],
            ),
          ),
          Expanded(
            child: Container(
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(30.0),
                    topRight: Radius.circular(30.0)),
              ),
              child: Padding(
                padding: EdgeInsets.only(
                    top: 8.0, bottom: 8.0, left: 30.0, right: 60.0),
                child: ListViewCheck(),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
