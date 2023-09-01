import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:testdemo/model/fruit.dart';
import 'package:testdemo/views/fruitItem.dart';
import 'package:testdemo/views/fruitList.dart';

class MyHomePage extends StatelessWidget {
 //items
  final String title;
  final Future<List<Fruit>> products;

  //constructor
  MyHomePage({Key? key, required this.title, required this.products}) :
        super(key: key);

  @override
  Widget build(BuildContext context)
  {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Color(0xFF4CAF50),
          title: Text("Test App"),
        ),
        body: Center(
          child: FutureBuilder<List<Fruit>>(
            future: products,
            builder: (context, snapshot) {
              if (snapshot.hasError) print(snapshot.error);
              return snapshot.hasData
                  ? FruitList(items: snapshot.data)
                  : Center(child: CircularProgressIndicator());
            },
          ),
        ));
  }
}