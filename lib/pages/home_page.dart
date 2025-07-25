import 'package:flutter/material.dart';
import 'package:noteapp/controller/note_controller.dart';
import 'package:provider/provider.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  late NoteController noteController;
  @override
  void initState() {
    super.initState();
    noteController = context.read();
    noteController.getPosts();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Consumer<NoteController>(
        builder: (context, controller, child) {
          return ListView.separated(
            itemBuilder:
                (context, index) => Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(controller.posts[index].title),
                    Text(controller.posts[index].body),
                    Text(controller.posts[index].id.toString()),
                  ],
                ),
            separatorBuilder: (context, index) => SizedBox(height: 10),
            itemCount: controller.posts.length,
          );
        },
      ),
    );
  }
}
