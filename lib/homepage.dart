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
        title: Text("Notes Application", style: TextStyle(color: Colors.white),),
        centerTitle: true,
        backgroundColor: Colors.blue,
        actions: [
          IconButton(onPressed: (){
            Navigator.pop(context);
          }, icon: Icon(Icons.logout, color: Colors.white,)),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: (){
          showDialog(context: context, builder: (BuildContext context) =>
            AlertDialog(
              title: Container(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    Text("NOTES"),
                    TextField(
                      controller: taskCont,
                      decoration: InputDecoration(
                        hintText: "Enter the Task",
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.all(Radius.circular(10)),
                        ),
                      ),
                    ),

                    SizedBox(height: 10,),
                    GestureDetector(
                      onTap: () async{
                        if(taskCont.text.trim().isNotEmpty){
                          await FirebaseOpt().addNotes(taskCont.text.trim());
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
        child: Icon(Icons.add, color: Colors.white,),
        backgroundColor: Colors.blue,
      ),
      body: StreamBuilder(
        stream: FirebaseOpt().readAllData(),
        builder: (context, snapshot){
          if(snapshot.hasData){
            return ListView.builder(
              itemCount: snapshot.data!.docs.length,
              itemBuilder: (con, ind){
                return Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: ListTile(
                    shape: RoundedRectangleBorder(
                     // side: BorderSide(color: Colors.black, width: 1),
                      borderRadius: BorderRadius.circular(5),
                    ),
                    tileColor: Colors.lightBlue,
                    textColor: Colors.black,
                    title: Text("Notes"),
                    subtitle: Text("${snapshot.data!.docs[ind]["Notes"]}"),
                  ),
                );
              },
            );
          }
          else{
            return Center(
              child: Text("Add a note..."),
            );
          }
        },
      ),
    );
  }
}
