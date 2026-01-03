//import 'package:bottom_tab_bar/views/pages/persons_page.dart';
import 'package:flutter/material.dart';

class CompanyWidget extends StatelessWidget {
  const CompanyWidget({
    super.key,
    required this.id,
    required this.name,
    required this.description,
    required this.phone,
    required this.email,
  });

  final int id;
  final String name;
  final String description;
  final String phone;
  final String email;

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
              Column(
                children: [
                  Row(
                    children: [
                      Expanded(
                        child: Text(
                          name,
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 16,
                          ),
                        ),
                      ),
                      Expanded(child: Text(phone, textAlign: TextAlign.end)),
                    ],
                  ),
                  Row(
                    children: [
                      Expanded(
                        child: Text(
                          description,
                          style: TextStyle(
                            fontWeight: FontWeight.normal,
                            fontSize: 14,
                          ),
                        ),
                      ),
                    ],
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
