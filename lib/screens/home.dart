import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_todo_app/constants/colors.dart';
import 'package:flutter_todo_app/models/todo.dart';
import 'package:flutter_todo_app/widgets/todo_item.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  final todosList = ToDo.todoList();
  final todoController = TextEditingController();
  List<ToDo> _foundToDo = [];

  @override
  void initState() {
    _foundToDo = todosList;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: tdBGColor,
      appBar: _buildAppBar(),
      body: Stack(
        children: [
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 15),
            child: Column(
              children: [
                _searchBox(),
                Expanded(
                    child: ListView(
                  children: [
                    Container(
                      margin: const EdgeInsets.only(top: 40, bottom: 20),
                      child: const Text(
                        'All ToDos',
                        style: TextStyle(
                            fontSize: 30, fontWeight: FontWeight.w500),
                      ),
                    ),
                    for (ToDo todo in _foundToDo.reversed)
                      ToDoItem(
                          toDo: todo,
                          onToDoChanged: _hadleToDOChange,
                          onDeleteItem: _deleteItem),
                  ],
                ))
              ],
            ),
          ),
          Align(
            alignment: Alignment.bottomCenter,
            child: Row(
              children: [
                Expanded(
                  child: Container(
                    padding:
                        const EdgeInsets.symmetric(horizontal: 20, vertical: 5),
                    margin:
                        const EdgeInsets.only(bottom: 15, right: 20, left: 20),
                    decoration: BoxDecoration(
                        color: Colors.white,
                        boxShadow: const [
                          BoxShadow(
                              color: Colors.grey,
                              offset: Offset(0.0, 0.0),
                              blurRadius: 10.0,
                              spreadRadius: 0.0)
                        ],
                        borderRadius: BorderRadius.circular(10)),
                    child: TextField(
                      controller: todoController,
                      decoration: const InputDecoration(
                          hintText: 'Add a new todo item',
                          border: InputBorder.none),
                    ),
                  ),
                ),
                Container(
                  margin: const EdgeInsets.only(bottom: 15, right: 20),
                  child: ElevatedButton(
                    onPressed: () {
                      _addToDoItem(todoController.text);
                    },
                    style: ElevatedButton.styleFrom(
                        backgroundColor: tdBlue,
                        minimumSize: const Size(55, 55),
                        elevation: 10),
                    child: const Text(
                      '+',
                      style: TextStyle(fontSize: 40),
                    ),
                  ),
                )
              ],
            ),
          ),
        ],
      ),
    );
  }

  void _hadleToDOChange(ToDo toDo) {
    setState(() {
      toDo.isDone = !toDo.isDone;
    });
  }

  void _deleteItem(String id) {
    setState(() {
      todosList.removeWhere((element) => element.id == id);
    });
  }

  void _addToDoItem(String toDo) {
    setState(() {
      todosList.add(ToDo(
          id: DateTime.now().millisecondsSinceEpoch.toString(),
          todoText: toDo));
    });
    todoController.clear();
  }

  void _runFilter(String enterKeyword) {
    List<ToDo> results = [];
    if (enterKeyword.isEmpty) {
      results = todosList;
    } else {
      results = todosList
          .where((element) => element.todoText!
              .toLowerCase()
              .contains(enterKeyword.toLowerCase()))
          .toList();
    }
    setState(() {
      _foundToDo = results;
    });
  }

  Container _searchBox() {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 15),
      decoration: BoxDecoration(
          color: Colors.white, borderRadius: BorderRadius.circular(20)),
      child: TextField(
        onChanged: ((value) => _runFilter(value)),
        decoration: const InputDecoration(
          contentPadding: EdgeInsets.all(0),
          prefixIcon: Icon(
            Icons.search,
            color: tdBlack,
            size: 20,
          ),
          prefixIconConstraints: BoxConstraints(
            maxHeight: 20,
            minWidth: 25,
          ),
          border: InputBorder.none,
          hintText: 'Search',
          hintStyle: TextStyle(color: tdGrey),
        ),
      ),
    );
  }

  AppBar _buildAppBar() {
    return AppBar(
      elevation: 0,
      backgroundColor: tdBGColor,
      title: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          const Icon(
            Icons.menu,
            color: tdBlack,
            size: 30,
          ),
          SizedBox(
            height: 40,
            width: 40,
            child: ClipRRect(
              borderRadius: BorderRadius.circular(20),
              child: Image.asset("assets/images/avatar.jpg"),
            ),
          )
        ],
      ),
    );
  }
}
