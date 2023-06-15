import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("HomePage"),
      ),
      body: ListView(
        padding: const EdgeInsets.all(16),
        children: <Widget>[
          const TextField(
            maxLines: 5,
            minLines: 1,
            keyboardType: TextInputType.multiline,
          ),
          ElevatedButton(onPressed: () {}, child: const Icon(Icons.check)),
          const Column(
            children: [
              Post(),
              Padding(
                padding: EdgeInsets.only(left: 32),
                child: Column(
                  children: [
                    Post(),
                    Post(),
                    Post(),
                  ],
                ),
              ),
              Divider(),
            ],
          ),
          const Column(
            children: [
              Post(),
              Padding(
                padding: EdgeInsets.only(left: 32),
                child: Column(
                  children: [
                    Post(),
                  ],
                ),
              ),
              Divider(),
            ],
          ),
          const Column(
            children: [
              Post(),
              Padding(
                padding: EdgeInsets.only(left: 32),
                child: Column(
                  children: [],
                ),
              ),
              Divider(),
            ],
          ),
        ],
      ),
    );
  }
}

class Post extends StatelessWidget {
  const Post({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
          // border: Border(
          //   bottom: BorderSide(color: Colors.grey),
          // ),
          ),
      child: const ListTile(
        leading: CircleAvatar(),
        title: Text('Usuario'),
        subtitle: Text(
            'Lorem ipsum dolor sit, amet consectetur adipisicing elit. Optio commodi nihil nam veritatis, laborum eos animi quis in, atque ea excepturi? Inventore vitae laboriosam, delectus nesciunt facere accusantium tenetur consectetur?'),
      ),
    );
  }
}
