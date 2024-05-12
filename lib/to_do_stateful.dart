//A query typically refers to a
//request for information or data
//from a database or search engine.
// In computing, it's often used to
// retrieve specific information
// that matches certain criteria.
// For example, when you search
// for something on a search engine
// like Google, you're essentially
// submitting a query to the search
// engine's database,asking it to
//  return relevant results based on
// the keywords or terms you entered.
// Similarly, in database management systems,
//  queries are used to retrieve, insert,
// update, or delete data from a database.
import 'package:flutter/material.dart';

class NewFile extends StatefulWidget {
  const NewFile({Key? key}) : super(key: key);

  @override
  State<NewFile> createState() => NewFileState();
}

class NewFileState extends State<NewFile> {
  TextEditingController newSentence = TextEditingController();
  List<String> sentences = [];
  List<bool> checkboxValues = [];
  List<Color> textColors = [];
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
                  focusedBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: Color(0xff321a70))),
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
                  sentences.add(newSentence.text);
                  checkboxValues.add(false);
                  textColors.add(const Color(0xff321a70));
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
            ListView.builder(
                shrinkWrap: true,
                itemCount: sentences.length,
                itemBuilder: (context, index) {
                  return Row(
                    children: [
                      Checkbox(
                        value: checkboxValues[index],
                        onChanged: (value) {
                          setState(() {
                            checkboxValues[index] = value!;
                            if (value) {
                              textColors[index] = Colors.grey;
                            } else {
                              textColors[index] = Color(0xff321a70);
                            }
                          });
                        },
                        activeColor: const Color(0xff321a70),
                      ),
                      const SizedBox(
                        width: 10,
                      ),
                      Text(
                        sentences[index],
                        style: TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.bold,
                            color: textColors[index]),
                      )
                    ],
                  );
                }),
          ],
        ),
      ),
    );
  }
}
