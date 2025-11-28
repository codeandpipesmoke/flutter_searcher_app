// https://kereso.vzsfoto.hu/api/finders/sync/2023-01-01.json
import 'dart:convert';
import 'dart:async';
import 'package:bottom_tab_bar/model/model.dart';
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
      Uri.parse('https://kereso.vzsfoto.hu/api/finders/sync/2023-01-01.json'),
    );
    var responseBody = response.body;
    var jsonData = jsonDecode(responseBody);

    //print(jsonData['datas']['categories']);
    //var categories = data['datas']['categories'];
    //var jsonString = '[{"id":7,"user_id":"cbb7b961-0a29-433a-a82d-c31fb06c9642","name":"\u00c1llatorvosok","description":"\u00e1llatorvos, \u00e1llatk\u00f3rh\u00e1z, rendel\u0151","slug":"allatorvos allatorvos allatkorhaz rendelo","keywords":null,"iconType":"MaterialCommunityIcons","icon":"dog-side","pos":500,"visible":true,"action":"new","person_count":2,"created":"2023-08-16T14:01:25+00:00","modified":"2025-10-31T14:55:25+00:00"},{"id":3,"user_id":"cbb7b961-0a29-433a-a82d-c31fb06c9642","name":"Aut\u00f3szerel\u0151k","description":"aut\u00f3villamoss\u00e1g, kl\u00edma","slug":"autoszerelo autoelektromossag autovillamossag klima javitas szemelygepkocsi szerviz","keywords":null,"iconType":"MaterialCommunityIcons","icon":"car-outline","pos":500,"visible":true,"action":"new","person_count":2,"created":"2023-08-16T13:25:44+00:00","modified":"2025-10-31T14:55:20+00:00"},{"id":1,"user_id":"cbb7b961-0a29-433a-a82d-c31fb06c9642","name":"K\u00f3rh\u00e1zak","description":"k\u00f3rh\u00e1zak","slug":"korhaz korhazak","keywords":null,"iconType":"MaterialCommunityIcons","icon":"hospital-o","pos":500,"visible":true,"action":"upd","person_count":1,"created":"2023-08-16T11:42:57+00:00","modified":"2025-10-31T14:55:16+00:00"},{"id":4,"user_id":"cbb7b961-0a29-433a-a82d-c31fb06c9642","name":"\u00c9lelmiszer","description":"\u00c9lelmiszer kis- \u00e9s nagykereskedelem","slug":"elelmiszer elelmiszer kis es nagykereskedelem","keywords":null,"iconType":"Feather","icon":"shopping-cart","pos":1000,"visible":true,"action":"upd","person_count":2,"created":"2023-08-16T13:41:49+00:00","modified":"2023-08-17T11:27:02+00:00"},{"id":2,"user_id":"cbb7b961-0a29-433a-a82d-c31fb06c9642","name":"Iskola","description":"Iskol\u00e1k","slug":"iskola iskolak","keywords":null,"iconType":"Ionicons","icon":"school-outline","pos":1000,"visible":true,"action":"new","person_count":2,"created":"2023-08-16T11:44:37+00:00","modified":"2023-08-16T11:44:37+00:00"},{"id":30,"user_id":"cbb7b961-0a29-433a-a82d-c31fb06c9642","name":"\u00d6nkorm\u00e1nyzat","description":"\u00f6nkorm\u00e1nyzatok, v\u00e1rosh\u00e1z\u00e1k","slug":"onkormanyzat onkormanyzatok varoshazak","keywords":null,"iconType":"MaterialCommunityIcons","icon":"office-building-outline","pos":1000,"visible":true,"action":"new","person_count":1,"created":"2023-08-18T06:21:41+00:00","modified":"2023-08-18T06:21:41+00:00"}]';
    //var jsonData = jsonDecode(jsonString);

    /*
    print(
      (jsonData['datas']['categories'] as List).map(Category.fromJson).toList(),
    );
    */

    return (jsonData['datas']['categories'] as List)
        .map(Category.fromJson)
        .toList();
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
        if (!snapshot.hasData) {
          return Center(child: CircularProgressIndicator());
        } else {
          return ListView(
            children: [
              for (var category in snapshot.requireData)
                ContainerWidget(
                  name: category.name,
                  description: category.description,
                ),
            ],
          );
        }
      },
    );
  }
}
