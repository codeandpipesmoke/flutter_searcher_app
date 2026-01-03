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
  String searchText = '';
  String url = 'http://kereso.loc/api/v1/categories.json';

  // ignore: unused_field
  Future<List<Category>>? _categoryRequest;

  Future<List<Category>> _loadCategory() async {
    var response = await http.get(
      //Uri.parse('https://kereso.vzsfoto.hu/api/finders/sync/2023-01-01.json'),
      Uri.parse(url),
    );
    var responseBody = response.body;
    var jsonData = jsonDecode(responseBody);
    print(jsonData['data']);
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
              Container(
                padding: EdgeInsets.symmetric(horizontal: 0, vertical: 0),
                decoration: BoxDecoration(
                  //borderRadius: BorderRadius.circular(8),
                  color: Colors.white,
                ),
                child: Row(
                  children: [
                    Expanded(
                      child: TextField(
                        //controller: _searchController,
                        //onChanged: (_) => {_filterItems(_searchController.text)},
                        decoration: InputDecoration(
                          contentPadding: EdgeInsets.all(16),
                          filled: true,
                          fillColor: Colors.white,
                          hintMaxLines: 1,
                          hintText: 'Keresés...',
                          border: InputBorder.none,
                          suffixIcon: Icon(Icons.search),
                        ),
                        onChanged: (text) {
                          setState(() {
                            if (text.characters.isNotEmpty) {
                              url =
                                  'http://kereso.loc/api/v1/categories.json?q=$text';
                            } else {
                              url = 'http://kereso.loc/api/v1/categories.json';
                            }
                            _loadCategory();
                          });
                          //print(
                          //  'First text field: $text (${text.characters.length})',
                          //);
                        },
                      ),
                    ),
                    //SizedBox(width: 10),
                    //Icon(Icons.search),
                  ],
                ),
              ),

              for (var category in snapshot.requireData)
                GestureDetector(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (_) =>
                            CompaniesPage(id: category.id, name: category.name),
                      ),
                    );
                  },
                  child: ContainerWidget(
                    id: category.id,
                    name: category.name,
                    description: category.description,
                    icon_ext: category.icon_ext,
                  ),
                ),
            ],
          );
        }
      },
    );
  }
}
