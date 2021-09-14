import 'package:app_mobx/src/shared/router_app.dart';
import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('HOME'),
        centerTitle: true,
      ),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.add),
        onPressed: () {
          Navigator.pushNamed(context, RouterApp.PEOPLE_KEY);
        },
      ),
      body: Column(children: [
        Expanded(
          child: ListView(),
        ),
      ]),
    );
  }
}
