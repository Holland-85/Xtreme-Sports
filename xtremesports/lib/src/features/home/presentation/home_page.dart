import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(60.0),
        child: AppBar(
          title: const Padding(
            padding: EdgeInsets.only(top: 10.0),
            child: Text(
              'FEEDS',
              style: TextStyle(color: Colors.white),
            ),
          ),
          backgroundColor: const Color.fromARGB(255, 130, 130, 130),
          elevation: 0,
        ),
      ),
      body: ListView.builder(
        itemCount: 4,
        itemBuilder: (context, index) {
          return const PostWidget();
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          // Hier können Sie eine Aktion hinzufügen
        },
        backgroundColor: Colors.black,
        child: const Icon(Icons.add, color: Colors.white),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.endFloat,
    );
  }
}

class PostWidget extends StatelessWidget {
  const PostWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(16),
      margin: const EdgeInsets.symmetric(vertical: 8),
      color: Colors.white,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Row(
            children: [
              CircleAvatar(
                backgroundColor: Colors.grey,
                radius: 25,
              ),
              SizedBox(width: 8),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text('Account name', style: TextStyle(fontWeight: FontWeight.bold)),
                  Text('Location'),
                ],
              ),
              Spacer(),
              Column(
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  Text('Date'),
                  Icon(Icons.more_vert),
                ],
              ),
            ],
          ),
          const SizedBox(height: 16),
          Container(
            height: 200,
            color: Colors.grey.shade300,
          ),
          const SizedBox(height: 8),
          const Text('Lorem ipsum dolor sit amet consectetur.'),
          const SizedBox(height: 8),
          const Row(
            children: [
              Chip(
                label: Text('Lorem ipsum'),
                backgroundColor: Color(0xFFE0E0E0),
              ),
              SizedBox(width: 4),
              Chip(
                label: Text('Lorem ipsum'),
                backgroundColor: Color(0xFFE0E0E0),
              ),
            ],
          ),
          const SizedBox(height: 8),
          const Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Icon(Icons.favorite_border),
              Icon(Icons.comment),
              Icon(Icons.share),
              Icon(Icons.bookmark_border),
            ],
          ),
        ],
      ),
    );
  }
}
