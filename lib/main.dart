import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Bidimensional cupertino picker',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  List<int> days = [1, 2, 3, 4, 5, 6, 7, 8, 9];
  int selectedDay = 1;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Bidimensional cupertino picker"),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          mainAxisSize: MainAxisSize.min,
          children: [
            Text(
              "Day selected: $selectedDay",
              textAlign: TextAlign.center,
              style: const TextStyle(
                  color: Colors.black,
                  fontWeight: FontWeight.bold,
                  fontSize: 20),
            ),
            ElevatedButton(
                child: const Text("Choose day"),
                onPressed: () => showModalBottomSheet(
                    context: context,
                    builder: (context) => _getDayPicker(days))),
          ],
        ),
      ),
    );
  }

  _getDayPicker(List<int> days) {
    return SizedBox(
      height: 240,
      child: CupertinoPicker(
        backgroundColor: Colors.white,
        squeeze: 1,
        useMagnifier: false,
        itemExtent: 40.0,
        scrollController:
            // This sets the initial item
            FixedExtentScrollController(
          initialItem: 0,
        ),
        // This is called when selected item is changed.
        onSelectedItemChanged: (int selectedItem) {
          setState(() {
            selectedDay = days[selectedItem];
          });
        },
        diameterRatio: 100,
        //20,
        selectionOverlay: Container(
          width: double.infinity,
          color: Colors.blue.withAlpha(50),
        ),
        children: List<Widget>.generate(days.length, (int index) {
          return Center(
            child: Text(
              "Day ${days[index]}",
              style: const TextStyle(color: Colors.indigo),
            ),
          );
        }),
      ),
    );
  }
}
