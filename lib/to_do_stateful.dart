import 'package:flutter/material.dart';

class NewFile extends StatefulWidget {
  const NewFile({Key? key}) : super(key: key);

  @override
  State<NewFile> createState() => NewFileState();
}

class NewFileState extends State<NewFile> {
  TextEditingController newSentence = TextEditingController();
  String sentence = '';
  bool flag = false;
  bool _isVisible = false; // Initially, checkbox is hidden
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        titleTextStyle: const TextStyle(
            color: Colors.white, fontSize: 30, fontWeight: FontWeight.bold),
        backgroundColor: const Color(0xff0140a28),
        centerTitle: true,
        leading: const Icon(
          Icons.menu,
          color: Colors.white,
        ),
        title: const Text("To Do List"),
        actions: [
          IconButton(
            onPressed: () {},
            iconSize: 50,
            icon: const CircleAvatar(
              backgroundColor: Color(0xff321a70),
              radius: 50,
              child: Icon(Icons.add, size: 30, color: Colors.white),
            ),
          ),
        ],
      ),
      body: Container(
        width: double.infinity,
        child: Column(
          children: [
            const SizedBox(
              height: 20,
            ),
            Container(
              width: 325,
              child: TextFormField(
                controller: newSentence,
                decoration: const InputDecoration(
                  labelText: "New Sentence",
                  labelStyle: TextStyle(color: Color(0xff321a70)),
                  border: OutlineInputBorder(),
                  prefixIcon: Icon(Icons.edit),
                  prefixIconColor: Color(0xff321a70),
                ),
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            MaterialButton(
              onPressed: () {
                setState(() {
                  // Toggle visibility
                  _isVisible = true;
                  flag = false;
                  sentence = newSentence.text;
                  newSentence.clear();
                });
              },
              color: const Color(0xff321a70),
              textColor: Colors.white,
              child: const Text('Submit'),
            ),
            const SizedBox(
              height: 20,
            ),
            Row(
              children: [
                Visibility(
                    visible: _isVisible,
                    child: Checkbox(
                      value: flag,
                      onChanged: (value) {
                        setState(() {
                          flag = value!;
                        });
                      },
                      activeColor: const Color(0xff321a70),
                    )),
                const SizedBox(
                  width: 10,
                ),
                Text(
                  sentence,
                  style: const TextStyle(
                      fontSize: 20, fontWeight: FontWeight.bold),
                )
              ],
            ),
          ],
        ),
      ),
    );
  }
}
