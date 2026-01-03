//import 'package:bottom_tab_bar/views/pages/persons_page.dart';
import 'package:flutter/material.dart';

class ContainerWidget extends StatelessWidget {
  const ContainerWidget({
    super.key,
    required this.id,
    // ignore: non_constant_identifier_names
    required this.icon_ext,
    required this.name,
    required this.description,
  });

  final int id;
  // ignore: non_constant_identifier_names
  final String icon_ext;
  final String name;
  final String description;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: EdgeInsets.all(0.0),
      child: Card(
        child: Padding(
          padding: EdgeInsets.only(top: 10, right: 12, bottom: 10, left: 20),
          child: Column(
            children: [
              Row(
                children: [
                  //Expanded(
                  //  child: SizedBox(
                  //    height: 35,
                  //    child: Image.network(
                  //      'http://kereso.loc/img/icons/${id}_icon.png',
                  //      cacheWidth: 30,
                  //      //width: 30,
                  //    ),
                  //  ),
                  //),
                  Expanded(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Align(
                          alignment: Alignment.centerLeft,
                          child: Text(
                            name,
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 16,
                            ),
                          ),
                        ),
                        Align(
                          alignment: Alignment.centerLeft,
                          child: Text(description),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
