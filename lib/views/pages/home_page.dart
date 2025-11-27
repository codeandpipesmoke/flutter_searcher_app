import 'package:flutter/material.dart';

import '../../widgets/container_widget.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(20.0),
      child: SingleChildScrollView(
        child: Column(
          children: [
            // 3:41
            ContainerWidget(name: 'Zsolt', description: 'programozó'),
            ContainerWidget(name: 'Zsolt', description: 'programozó'),
            ContainerWidget(name: 'Zsolt', description: 'programozó'),
            ContainerWidget(name: 'Zsolt', description: 'programozó'),
          ],
        ),
      ),
    );
  }
}
