import 'package:flutter/material.dart';

class GroupsAndEventsPage extends StatelessWidget {
  const GroupsAndEventsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Groups/Events/Tricklist'),
      ),
      body: const Center(
        child: Text('Group/Events/Tricklist\n Page'),
      ),
    );
  }
}
