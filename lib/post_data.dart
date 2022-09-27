import 'package:flutter/material.dart';
import 'package:todoappwithapi/services/services.dart';

class PostData extends StatefulWidget {
  const PostData({Key? key}) : super(key: key);

  @override
  State<PostData> createState() => _PostDataState();
}

class _PostDataState extends State<PostData> {
  TextEditingController edittt = TextEditingController();
  TextEditingController titleee = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        actions: [IconButton(onPressed: () {}, icon: Icon(Icons.backpack))],
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          TextField(
            controller: edittt,
          ),
          TextField(
            controller: titleee,
          ),
          
          ElevatedButton(
              onPressed: () {
                setState(() {
                  ApiService()
                      .postdata(isCompleted: edittt.text, title: titleee.text);
                });
              },
              child: Text('Edit'))
        ],
      ),
    );
  }
}
