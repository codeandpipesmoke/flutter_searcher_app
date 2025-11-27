import 'package:flutter/material.dart';

class HomePageListItem extends StatelessWidget{
  const HomePageListItem({super.key, required this.name, required this.description});

  final String name;
  final String description;

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 1,
      margin: const EdgeInsets.only(top: 0, right: 5, bottom: 10, left: 5),
      child: ListTile(
        onTap: () {
          // TODO
        },
        leading: CircleAvatar(
          backgroundColor: Colors.blue,
          child: Text('A', style: TextStyle(color: Colors.white)),
        ),
        //visualDensity: VisualDensity(vertical: 0),
        contentPadding: EdgeInsets.only(top: 0, bottom: 0, left: 15, right: 8.0,),
        title: Text(name, style: TextStyle(fontWeight: FontWeight.bold),),
        subtitle: Text(description),
        trailing: Icon(Icons.star),
      ),
    );
  }
}