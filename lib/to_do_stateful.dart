import 'package:flutter/material.dart';
import 'package:sqflite/sqflite.dart';

class NewFile extends StatefulWidget {
  const NewFile({super.key});

  @override
  State<NewFile> createState() => _NewFileState();
}

class _NewFileState extends State<NewFile> {
  Database? dataBase;
  TextEditingController name = TextEditingController();
  TextEditingController age = TextEditingController();
  TextEditingController grade = TextEditingController();
  late List<Map> studentsData = [];

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    createDatabase();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: const Color(0xff0140a28),
        title: const Text("Data base example",
            style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold)),
      ),
      body: SingleChildScrollView(
        child: Container(
          width: double.infinity,
          padding: const EdgeInsets.all(10),
          child: Column(
            children: [
              TextFormField(
                controller: name,
                decoration: const InputDecoration(
                  border: OutlineInputBorder(),
                  focusedBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: Color(0xff321a70))),
                  labelText: "Name",
                  labelStyle: TextStyle(color: Color(0xff321a70)),
                ),
              ),
              const SizedBox(
                height: 10,
              ),
              TextFormField(
                controller: age,
                decoration: const InputDecoration(
                  border: OutlineInputBorder(),
                  focusedBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: Color(0xff321a70))),
                  labelText: "Age",
                  labelStyle: TextStyle(color: Color(0xff321a70)),
                ),
              ),
              const SizedBox(
                height: 10,
              ),
              TextFormField(
                controller: grade,
                decoration: const InputDecoration(
                  border: OutlineInputBorder(),
                  focusedBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: Color(0xff321a70))),
                  labelText: "Grade",
                  labelStyle: TextStyle(color: Color(0xff321a70)),
                ),
              ),
              const SizedBox(
                height: 10,
              ),
              MaterialButton(
                onPressed: () async {
                  if (name.text.isEmpty ||
                      age.text.isEmpty ||
                      grade.text.isEmpty) {
                    print("Empty field");
                  } else {
                    await insertToDatabase(
                        name: name.text,
                        age: int.parse(age.text),
                        grade: grade.text);
                    studentsData = await getDataFromDataBase();
                    setState(() {
                      name.clear();
                      age.clear();
                      grade.clear();
                    });
                  }
                },
                color: const Color(0xff321a70),
                textColor: Colors.white,
                child: const Text('Submit'),
              ),
              const SizedBox(
                height: 20,
              ),
              ListView.builder(
                  padding: const EdgeInsets.all(8),
                  physics: const NeverScrollableScrollPhysics(),
                  shrinkWrap: true,
                  itemCount: studentsData.length,
                  itemBuilder: (context, index) {
                    return Column(
                      children: [
                        Text(studentsData[index]["name"]),
                        const SizedBox(
                          height: 20,
                        ),
                        Text(studentsData[index]["age"].toString()),
                        const SizedBox(
                          height: 20,
                        ),
                        Text(studentsData[index]["grade"]),
                      ],
                    );
                  }),
            ],
          ),
        ),
      ),
    );
  }

  void createDatabase() async {
    dataBase = await openDatabase(
      "students.db",
      version: 1,
      onCreate: (database, version) async {
        print("database created");
        await database.execute(
            'CREATE TABLE students (id INTEGER PRIMARY KEY,name TEXT,age INTEGER,grade TEXT)');
      },
    );
    if (dataBase == null) {
      throw Exception('Failed to open database.');
    }
  }

  Future insertToDatabase({
    required String name,
    required int age,
    required String grade,
  }) async {
    try {
      await dataBase?.transaction(
        (txn) {
          print("Insert");
          return txn.execute(
            'INSERT INTO students(name,age,grade) VALUES("$name","$age","$grade")',
          );
        },
      );
    } catch (error) {
      print("error in insert is $error");
    }
  }

  Future<List<Map>> getDataFromDataBase() async {
    studentsData = await dataBase!.query('students');
    print(studentsData);
    return studentsData;
  }
}
