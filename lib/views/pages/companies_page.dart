// https://kereso.vzsfoto.hu/api/finders/sync/2023-01-01.json
import 'dart:convert';
import 'dart:async';
import 'package:bottom_tab_bar/model/model.dart';
//import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import '../../widgets/company_widget.dart';

class CompaniesPage extends StatefulWidget {
  const CompaniesPage({super.key, required this.id, required this.name});

  final int id;
  final String name;

  @override
  State<CompaniesPage> createState() => _CompaniesPageState();
}

/*
// https://stackoverflow.com/questions/56050165/creating-a-list-from-json-in-flutter
*/
class _CompaniesPageState extends State<CompaniesPage> {
  // ignore: non_constant_identifier_names
  Future<List<Company>>? _CompanyRequest;

  Future<List<Company>> _loadCompany() async {
    var url = 'http://kereso.loc/api/v1/companies/${widget.id}.json';
    //print('Loading companies from: $url');
    var response = await http.get(
      //Uri.parse('https://kereso.vzsfoto.hu/api/finders/sync/2023-01-01.json'),
      Uri.parse(url),
    );
    var responseBody = response.body;
    //print('Response status: ${response.statusCode}');
    //print('Response body: $responseBody');
    var jsonData = jsonDecode(responseBody);
    //print('JSON data keys: ${jsonData.keys}');
    //print('JSON data: $jsonData');

    if (jsonData['data'] == null) {
      //print('ERROR: jsonData["data"] is null!');
      //print('Available keys: ${jsonData.keys}');
      return [];
    }

    var dataList = jsonData['data'] as List;
    //print('Data list length: ${dataList.length}');
    if (dataList.isNotEmpty) {
      //print('First item: ${dataList[0]}');
    }

    try {
      var companies = dataList.map((item) {
        //print('Processing item: $item');
        return Company.fromJson(item);
      }).toList();
      //print('Successfully parsed ${companies.length} companies');
      return companies;
    } catch (e) {
      //print('ERROR parsing companies: $e');
      //print('Stack trace: $stackTrace');
      rethrow;
    }
  }

  @override
  void initState() {
    _CompanyRequest = _loadCompany();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(widget.name)),
      body: FutureBuilder(
        future: _CompanyRequest,
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return Center(child: CircularProgressIndicator());
          }

          if (snapshot.hasError) {
            return Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(Icons.error_outline, size: 48, color: Colors.red),
                  SizedBox(height: 16),
                  Text(
                    'Hiba történt:',
                    style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                  ),
                  SizedBox(height: 8),
                  Padding(
                    padding: EdgeInsets.all(16),
                    child: Text(
                      snapshot.error.toString(),
                      textAlign: TextAlign.center,
                    ),
                  ),
                ],
              ),
            );
          }

          if (!snapshot.hasData) {
            return Center(child: Text('Nincsenek adatok'));
          }

          final companies = snapshot.data!;
          if (companies.isEmpty) {
            return Center(child: Text('Nincsenek cégek'));
          }

          return ListView(
            children: [
              for (var company in companies)
                CompanyWidget(
                  id: company.id,
                  name: company.name,
                  description: company.description,
                  phone: company.phone,
                  email: company.email,
                ),
            ],
          );
        },
      ),
    );
  }
}
