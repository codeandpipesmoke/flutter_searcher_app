// https://kereso.vzsfoto.hu/api/finders/sync/2023-01-01.json
import 'dart:convert';
import 'dart:async';
import 'package:bottom_tab_bar/model/model.dart';
//import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class PersonsPage extends StatefulWidget {
  const PersonsPage({super.key, required this.id});

  final int id;

  @override
  State<PersonsPage> createState() => _PersonsPageState();
}

/*
// https://stackoverflow.com/questions/56050165/creating-a-list-from-json-in-flutter
*/
class _PersonsPageState extends State<PersonsPage> {
  // ignore: non_constant_identifier_names
  Future<List<Person>>? _PersonRequest;

  Future<List<Person>> _loadPerson() async {
    var response = await http.get(
      //Uri.parse('https://kereso.vzsfoto.hu/api/finders/sync/2023-01-01.json'),
      Uri.parse('http://kereso.loc/api/v1/companies/1.json'),
    );
    var responseBody = response.body;
    var jsonData = jsonDecode(responseBody);

    return (jsonData['datas']['persons'] as List).map(Person.fromJson).toList();
  }

  @override
  void initState() {
    _PersonRequest = _loadPerson();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Persons')),
      body: FutureBuilder(
        future: _PersonRequest,
        builder: (context, snapshot) {
          if (!snapshot.hasData) {
            return Center(child: CircularProgressIndicator());
          } else {
            return ListView(
              children: [
                /*
                for (var persons in snapshot.requireData)
                  if (persons.category_id == widget.id)
                    ContainerWidget(
                      id: persons.id,
                      name: persons.name,
                      description: persons.description,
                    ),
                    */
              ],
            );
          }
        },
      ),
    );
  }
}
