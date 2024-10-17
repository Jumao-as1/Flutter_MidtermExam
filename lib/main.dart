import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: MidtermExam(),
    );
  }
}

class MidtermExam extends StatefulWidget {
  @override
  _MidtermExamState createState() => _MidtermExamState();
}

class _MidtermExamState extends State<MidtermExam> {
  final List<String> itemList = [
    'Detroit: Become Human',
    'NBA 2K24',
    'Call of Duty',
    'God of War',
    'Uncharted',
    'Red Dead Redemption 2',
    'The Last of Us',
    'Medal of Honor',
    'Resident Evil',
    'Battlefield'
  ];

  List<bool> addedStatus = List<bool>.generate(10, (index) => false);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Jumao-as_MidtermExam'),
        centerTitle: true,
        backgroundColor: Colors.teal,
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: [
            Expanded(
              child: ListView.builder(
                itemCount: itemList.length,
                itemBuilder: (context, index) {
                  return buildCard(index);
                },
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget buildCard(int index) {
    return Card(
      color: addedStatus[index] ? Colors.green.shade200 : Colors.white,
      elevation: 5,
      margin: const EdgeInsets.symmetric(vertical: 8.0),
      child: Padding(
        padding: const EdgeInsets.all(12.0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Expanded(
              child: Text(
                itemList[index],
                style: TextStyle(
                  fontSize: 18.0,
                  fontWeight: FontWeight.w500,
                ),
              ),
            ),
            Row(
              children: [
                ElevatedButton(
                  onPressed: () {
                    print('Details of ${itemList[index]}');
                  },
                  child: Text('Details'),
                ),
                SizedBox(width: 8),
                ElevatedButton(
                  onPressed: () {
                    setState(() {
                      addedStatus[index] = !addedStatus[index];
                    });
                  },
                  style: ButtonStyle(
                    backgroundColor: MaterialStateProperty.all(
                        addedStatus[index] ? Colors.grey : Colors.blue),
                  ),
                  child: Text(addedStatus[index] ? 'Added' : 'Add'),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
