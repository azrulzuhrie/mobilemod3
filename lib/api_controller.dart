import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'todo_model.dart';

class ApiController {
  Future<Todo> fetchTodo() async {
    final response = await http.get(Uri.parse('https://jsonplaceholder.typicode.com/todos/5'));

    if (response.statusCode == 200) {
      return Todo.fromJson(json.decode(response.body));
    } else {
      throw Exception('Failed to load todo');
    }
  }
}
