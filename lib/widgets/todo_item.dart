import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_todo_app/constants/colors.dart';
import 'package:flutter_todo_app/models/todo.dart';

class ToDoItem extends StatelessWidget {
  const ToDoItem(
      {super.key,
      required this.toDo,
      required this.onDeleteItem,
      required this.onToDoChanged});
  final ToDo toDo;
  final onToDoChanged;
  final onDeleteItem;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(bottom: 20),
      child: ListTile(
        contentPadding: const EdgeInsets.symmetric(horizontal: 20, vertical: 5),
        onTap: () {
          onToDoChanged(toDo);
        },
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
        tileColor: Colors.white,
        leading: Icon(
            toDo.isDone ? Icons.check_box : Icons.check_box_outline_blank,
            color: tdBlue),
        title: Text(
          toDo.todoText!,
          style: TextStyle(
              fontSize: 16,
              color: tdBlack,
              decoration: toDo.isDone ? TextDecoration.lineThrough : null),
        ),
        trailing: Container(
          padding: const EdgeInsets.all(0),
          margin: const EdgeInsets.symmetric(vertical: 12),
          height: 35,
          width: 35,
          decoration: BoxDecoration(
            color: tdRed,
            borderRadius: BorderRadius.circular(5),
          ),
          child: IconButton(
            onPressed: (() {
              onDeleteItem(toDo.id);
            }),
            icon: const Icon(Icons.delete),
            color: Colors.white,
            iconSize: 18,
          ),
        ),
      ),
    );
  }
}
