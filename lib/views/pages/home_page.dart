// https://kereso.vzsfoto.hu/api/finders/sync/2023-01-01.json
import 'dart:convert';
import 'dart:async';
import 'package:bottom_tab_bar/model/model.dart';
import 'package:bottom_tab_bar/views/pages/companies_page.dart';
//import 'package:bottom_tab_bar/views/pages/persons_page.dart';
//import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

import '../../widgets/container_widget.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

/*
 https://stackoverflow.com/questions/56050165/creating-a-list-from-json-in-flutter
*/
class _HomePageState extends State<HomePage> {
  // ignore: unused_field
  Future<List<Category>>? _categoryRequest;

  Future<List<Category>> _loadCategory() async {
    var response = await http.get(
      //Uri.parse('https://kereso.vzsfoto.hu/api/finders/sync/2023-01-01.json'),
      Uri.parse('http://kereso.loc/api/v1/categories.json'),
    );
    var responseBody = response.body;
    var jsonData = jsonDecode(responseBody);
    //print(jsonData['data']);
    return (jsonData['data'] as List).map(Category.fromJson).toList();
  }

  @override
  void initState() {
    _categoryRequest = _loadCategory();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: _categoryRequest,
      builder: (context, snapshot) {
        //print(snapshot);
        if (!snapshot.hasData) {
          return Center(child: CircularProgressIndicator());
        } else {
          return ListView(
            children: [
              for (var category in snapshot.requireData)
                GestureDetector(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (_) => CompaniesPage(id: category.id),
                      ),
                    );
                  },
                  child: ContainerWidget(
                    id: category.id,
                    name: category.name,
                    description: category.description,
                  ),
                ),
            ],
          );
        }
      },
    );
  }
}
