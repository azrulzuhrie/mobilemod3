import 'package:flutter/material.dart';
import 'api_controller.dart';
import 'todo_model.dart';

class TodosPage extends StatefulWidget {
  @override
  _TodosPageState createState() => _TodosPageState();
}

class _TodosPageState extends State<TodosPage> {
  final ApiController apiController = ApiController();
  late Future<Todo> _futureTodo;

  @override
  void initState() {
    super.initState();
    _futureTodo = apiController.fetchTodo();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Fetch Data Example'),
      ),
      body: Center(
        child: FutureBuilder<Todo>(
          future: _futureTodo,
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting) {
              return CircularProgressIndicator();
            } else if (snapshot.hasError) {
              return Text("Error: ${snapshot.error}");
            } else if (snapshot.hasData) {
              return Text("Title: ${snapshot.data!.title}");
            }
            return Text("No Data");
          },
        ),
      ),
    );
  }
}
