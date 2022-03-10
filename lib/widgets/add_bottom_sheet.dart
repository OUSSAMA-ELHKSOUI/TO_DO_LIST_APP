import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class AddBottomSheet extends StatelessWidget {
  AddBottomSheet({this.function});
  final Function function;

  @override
  Widget build(BuildContext context) {
    String taskName;

    return Container(
      color: Color(0xFF757575),
      child: Container(
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.only(
              topRight: Radius.circular(30.0), topLeft: Radius.circular(30.0)),
        ),
        child: Padding(
          padding:
              EdgeInsets.only(top: 20.0, left: 35.0, right: 35.0, bottom: 20.0),
          child: Column(
            children: [
              Text(
                'Add task',
                style: TextStyle(
                  color: Colors.lightBlueAccent,
                  fontSize: 30.0,
                  fontWeight: FontWeight.w900,
                ),
              ),
              SizedBox(
                height: 20.0,
              ),
              TextField(
                onChanged: (value) {
                  taskName = value;
                },
                decoration: InputDecoration(
                  hintText: 'wright you task',
                  // border: OutlineInputBorder(
                  //   borderRadius: BorderRadius.circular(30.0),
                  // ),
                  enabledBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.blueGrey),
                    borderRadius: BorderRadius.circular(30.0),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderSide:
                        BorderSide(color: Colors.lightBlueAccent, width: 2.5),
                    borderRadius: BorderRadius.circular(30.0),
                  ),
                ),
              ),
              SizedBox(
                height: 10.0,
              ),
              Material(
                elevation: 5.0,
                color: Colors.lightBlueAccent,
                borderRadius: BorderRadius.circular(30.0),
                child: MaterialButton(
                  child: Text(
                    'add task',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 20,
                    ),
                  ),
                  minWidth: double.infinity,
                  height: 60.0,
                  onPressed: () {
                    Navigator.pop(context, function(taskName));
                  },
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
