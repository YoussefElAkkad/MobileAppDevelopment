import 'package:flutter/material.dart';

class To_Do_List extends StatelessWidget {
  const To_Do_List({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        titleTextStyle: const TextStyle(
            color: Colors.white, fontSize: 30, fontWeight: FontWeight.bold),
        backgroundColor: Colors.blue,
        centerTitle: true,
        leading: const Icon(
          Icons.menu,
          color: Colors.white,
        ),
        title: const Text("To Do List"),
        actions: [
          IconButton(
            onPressed: () {
              print("Hello world");
            },
            icon: const Icon(
              Icons.add,
              color: Colors.white,
            ),
          )
        ],
      ),
      body: Container(
          width: double.infinity,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              const Padding(
                padding: EdgeInsets.all(8.0),
                child: Text(
                  "Do my math homework",
                  style: TextStyle(backgroundColor: Colors.amber),
                ),
              ),
              const Padding(
                padding: EdgeInsets.all(8.0),
                child: Text("Go to school on time",
                    style: TextStyle(backgroundColor: Colors.amber)),
              ),
              const Padding(
                padding: const EdgeInsets.all(8.0),
                child: const Text("Eat healthy food",
                    style: TextStyle(backgroundColor: Colors.amber)),
              ),
              const Padding(
                padding: const EdgeInsets.all(8.0),
                child: const Text("Study for Science Exam",
                    style: TextStyle(backgroundColor: Colors.green)),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: MaterialButton(
                  onPressed: () {
                    print("You can do this");
                  },
                  color: Colors.green,
                  textColor: Colors.white,
                  child: const Text("Motivation Button"),
                ),
              )
            ],
          )),
    );
  }
}
