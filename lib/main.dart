import 'package:flutter/material.dart';
import 'package:Todoey/screens/todo_screen.dart';
import 'package:provider/provider.dart';
import 'data.dart';
import 'database/sql.dart';

void main() => runApp(MyApp());

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  Sql sql = Sql();
  @override
  void initState() {
    super.initState();
    sql.db;
  }

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider<Data>(
      create: (context) => Data(),
      child: MaterialApp(
        home: TodoScreen(),
      ),
    );
  }
}
