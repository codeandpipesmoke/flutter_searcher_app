import 'package:flutter/material.dart';

class AddPage extends StatelessWidget{
  const AddPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        ElevatedButton(
          onPressed: () {
            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(
                duration: Duration(seconds: 2),
                content: Text('SnackBar 123'),
                behavior: SnackBarBehavior.floating,
              )
            );
          }, child: Text('SnackBar Message')
        ),
        ElevatedButton(
            onPressed: () {
              showDialog(
                context: context,
                builder: (context) {
                  return AlertDialog(
                    title: Text('Cím'),
                    content: Text('Alert content'), 
                  );
                }
              );
            }, child: Text('Open dialog')
        ),
        //DropdownButton(items: items, onChanged: onChanged)
      ],
    );
  }

}