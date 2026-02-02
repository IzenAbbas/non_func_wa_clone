import 'package:flutter/material.dart';

class IndividProf extends StatefulWidget {
  // final Text text;
  String? text;
  int? i;
  IndividProf({super.key, this.text, this.i});

  @override
  State<IndividProf> createState() => _IndividProfState();
}

class _IndividProfState extends State<IndividProf> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: widget.i! % 2 == 0
            ? Color.fromARGB(255, 118, 209, 173)
            : Color.fromARGB(255, 246, 245, 243),
        leadingWidth: 100,
        leading: Row(
          children: [
            IconButton(
              onPressed: () {
                Navigator.pop(context);
              },
              icon: Icon(Icons.arrow_back),
            ),
            widget.i! % 2 == 0
                ? Image.asset('assets/images/WAC2.png')
                : Image.asset('assets/images/WAC1.png'),
          ],
        ),

        title: Text('Contact ${widget.i}'),
        actions: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Icon(Icons.video_call),
          ),
          Padding(padding: const EdgeInsets.all(8.0), child: Icon(Icons.call)),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Icon(Icons.more_vert),
          ),
        ],
      ),

      body: Container(
        color: widget.i! % 2 == 0
            ? Color.fromARGB(255, 246, 245, 243)
            : Color.fromARGB(255, 118, 209, 173),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: TextField(
                decoration: InputDecoration(
                  filled: true,
                  fillColor: widget.i! % 2 == 0
                      ? Color.fromARGB(255, 118, 209, 173)
                      : Color.fromARGB(255, 246, 245, 243),
                  hintText: 'Enter Message',
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(20),
                  ),
                  disabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(20),
                    borderSide: BorderSide(width: 2, color: Colors.black),
                  ),
                  enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(20),
                    borderSide: BorderSide(width: 2, color: Colors.black),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(20),
                    borderSide: BorderSide(width: 2, color: Colors.black),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
