//import 'package:bottom_tab_bar/views/pages/persons_page.dart';
import 'package:flutter/material.dart';

class CategoryWidget extends StatelessWidget {
  const CategoryWidget({
    super.key,
    required this.id,
    required this.name,
    required this.description,
  });

  final int id;
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
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                name,
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
              ),
              Text(description),
            ],
          ),
        ),
      ),
    );
  }
}
