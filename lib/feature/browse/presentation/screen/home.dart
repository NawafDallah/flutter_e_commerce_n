import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';

import '../../../../init_dependencies.dart';

class Home extends StatelessWidget {
  const Home({super.key});

  @override
  Widget build(BuildContext context) {
    final user = sl<Box>().get("currentUser");
    return PopScope(
      canPop: false,
      child: Scaffold(
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(user['userId']!.toString()),
              Text(user['userName']), 
              Text(user['userEmail']), 
              Text(user['userPhone']!.toString()),
            ],
          ),
        ),
      ),
    );
  }
}
