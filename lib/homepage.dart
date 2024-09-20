// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';
import 'package:todoproj/fb.dart';

class Homepage extends StatefulWidget {
  const Homepage({super.key});

  @override
  State<Homepage> createState() => _HomepageState();
}

class _HomepageState extends State<Homepage> {
  final taskCont = TextEditingController();
  final noteCont = TextEditingController();
  @override
  Widget build(BuildContext context){
    return Scaffold(
      appBar: AppBar(
        title: Text("Notes Application"),
        centerTitle: true,
        backgroundColor: Colors.blue,
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: (){
          showDialog(context: context, builder: (BuildContext context) =>
            AlertDialog(
              title: Container(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    Text("Todo"),
                    TextField(
                      controller: taskCont,
                      decoration: InputDecoration(
                        hintText: "Enter the Task",
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.all(Radius.circular(20)),
                        ),
                      ),
                    ),
                    SizedBox(height: 10,),
                    TextField(
                      controller: noteCont,
                      decoration: InputDecoration(
                        hintText: "Enter a note",
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.all(Radius.circular(20)),
                        ),
                      ),
                    ),
                    SizedBox(height: 10,),
                    GestureDetector(
                      onTap: () async{
                        if(taskCont.text.trim().isNotEmpty && noteCont.text.trim().isNotEmpty){
                          await FirebaseOpt().addNotes(taskCont.text.trim(), noteCont.text.trim());
                        }
                        else if(taskCont.text.trim().isNotEmpty && noteCont.text.trim().isEmpty){
                          await FirebaseOpt().addNotes(taskCont.text.trim(), "No Note Added");
                        }
                      },
                      child: Container(
                        height: 40,
                        width: 100,
                        decoration: BoxDecoration(
                          color: Colors.indigo,
                          borderRadius: BorderRadius.all(Radius.circular(20)),
                        ),
                        child: Center(child: Text("Add", style: TextStyle(color: Colors.white),)),
                      ),
                    )
                  ],
                ),
              )

            )
          );
        },
        child: Icon(Icons.add),
        backgroundColor: Colors.blue,
      ),
    );
  }
}
