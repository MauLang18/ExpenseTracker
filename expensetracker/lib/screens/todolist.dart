import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';
import '../data/model/add_todo.dart';
import '../data/utility.dart';
import '../widgets/chart.dart';

import '../data/model/add_date.dart';
import '../data/top.dart';

class TodoList extends StatefulWidget {
  const TodoList({Key? key}) : super(key: key);

  @override
  State<TodoList> createState() => _TodoListState();
}

ValueNotifier kj = ValueNotifier(0);

class _TodoListState extends State<TodoList> {
  var history;
  final box = Hive.box<Add_todo>('todo');
  final TextEditingController todo_C = TextEditingController();
  FocusNode todolist_ = FocusNode();

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    todolist_.addListener(() {
      setState(() {});
    });
  }

  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: ValueListenableBuilder(
          valueListenable: kj,
          builder: (BuildContext context, dynamic value, Widget? child) {
            return custom();
          },
        ),
      ),
    );
  }

  CustomScrollView custom() {
    return CustomScrollView(
      slivers: [
        SliverToBoxAdapter(
          child: Column(
            children: [
              SizedBox(height: 20),
              Text(
                'Lista de Tareas Pendientes',
                style: TextStyle(
                  color: Colors.black,
                  fontSize: 20,
                  fontWeight: FontWeight.w700,
                ),
              ),
              SizedBox(height: 20),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 15),
                child: Align(
                  alignment: Alignment.bottomCenter,
                  child: Row(
                    children: [
                      Expanded(
                        child: Container(
                          margin: EdgeInsets.only(
                            bottom: 20,
                            right: 20,
                            left: 20,
                          ),
                          padding: EdgeInsets.symmetric(
                            horizontal: 20,
                            vertical: 5,
                          ),
                          decoration: BoxDecoration(
                            color: Colors.white,
                            boxShadow: [
                              BoxShadow(
                                  color: Colors.white,
                                  offset: Offset(0.0, 0.0),
                                  blurRadius: 10.0,
                                  spreadRadius: 0.0),
                            ],
                            borderRadius: BorderRadius.circular(10),
                          ),
                          child: TextField(
                            focusNode: todolist_,
                            controller: todo_C,
                            decoration: InputDecoration(
                              hintText: "Añadir una nueva tarea",
                              border: InputBorder.none,
                            ),
                          ),
                        ),
                      ),
                      Container(
                        margin: EdgeInsets.only(
                          bottom: 20,
                          right: 20,
                        ),
                        child: ElevatedButton(
                          child: Text(
                            "+",
                            style: TextStyle(fontSize: 40),
                          ),
                          onPressed: () {
                            var add = Add_todo(todo_C.text);
                            box.add(add);
                          },
                          style: ElevatedButton.styleFrom(
                            primary: Color.fromARGB(255, 47, 125, 121),
                            minimumSize: Size(60, 60),
                            elevation: 10,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              SizedBox(height: 20),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 15),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      'Tareas por Hacer',
                      style: TextStyle(
                          color: Colors.black,
                          fontSize: 16,
                          fontWeight: FontWeight.bold),
                    ),
                    Icon(
                      Icons.swap_vert,
                      size: 25,
                      color: Colors.grey,
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
        SliverList(
          delegate: SliverChildBuilderDelegate(
            (context, index) {
              history = box.values.toList()[index];
              return getList(history, index);
            },
            childCount: box.length,
          ),
        ),
      ],
    );
  }

  Widget getList(Add_todo history, int index) {
    return Dismissible(
        key: UniqueKey(),
        onDismissed: (direction) {
          history.delete();
        },
        child: get(index, history));
  }

  ListTile get(int index, Add_todo history) {
    return ListTile(
      leading: ClipRRect(
        borderRadius: BorderRadius.circular(5),
        child: Image.asset('images/tarea.png', height: 40),
      ),
      title: Text(
        history.name,
        style: TextStyle(
          fontSize: 17,
          fontWeight: FontWeight.w600,
        ),
      ),
    );
  }
}
