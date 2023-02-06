import 'dart:convert';
import 'dart:html';

import 'package:flutter/material.dart';
import 'package:flutter_dio/models/users.dart';
import 'package:http/http.dart' as http;

void main() {
  runApp(MyApp());
}

// ignore: use_key_in_widget_constructors
class MyApp extends StatefulWidget {
  @override
   Widget build(BuildContext context){
     return MaterialApp(home: Homepage());
        }
        
          @override
          State<StatefulWidget> createState() {
            // TODO: implement createState
            throw UnimplementedError();
          }
  }
 class Homepage extends StatefulWidget{
  @override
  _HomepageState createState() => _HomepageState();
  
 }
 class _HomepageState extends State<Homepage>{
  // ignore: unused_field
  Users _users = Users(data: []);
  bool loading =true;
 
  void getdata()async{
    var url = Uri.parse('https://fluttmac.github.io/api/user.json');
   final response = await http.get(url);
   var json = jsonDecode(response.body);
  _users = Users.fromJson(json);
  loading = false;
      }
      
  @override
  void initstate(){
    super.initState();
    getdata();
  }

  @override
  Widget build(BuildContext context) {
   return Scaffold(
    body: loading ?Center (
      child:CircularProgressIndicator(),
      ):
    ListView.builder(
      itemCount: _users.data!.length,
      itemBuilder: ((context, index) {
      return Container(
        margin: EdgeInsets.symmetric(vertical: 15),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20),
          color: Colors.blue
        ),
        child: Column(children: [
          Text(_users.data![index].name!),
          Text(_users.data![index].profession!),
        ]),
      );
      
    }))
   );    
  }
  
 }
 
