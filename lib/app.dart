import 'package:flutter/material.dart';
import 'package:todoappwithapi/models/models.dart';
import 'package:todoappwithapi/post_data.dart';
import 'package:todoappwithapi/services/services.dart';

class App extends StatefulWidget {
  const App({Key? key}) : super(key: key);

  @override
  State<App> createState() => _AppState();
}

class _AppState extends State<App> {
  List<Model>? result;
  var isloaded = false;

  getdata() async {
    result = await ApiService().getdata();

    if (isloaded != null) {
      setState(() {
        isloaded = true;
      });
    }
  }

  @override
  void initState() {
    getdata();
    super.initState();
  }

  TextEditingController edittt = TextEditingController();
  TextEditingController titleee = TextEditingController();
  TextEditingController idddd = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Visibility(
        visible: isloaded,
        replacement: Center(child: CircularProgressIndicator()),
        child: Scaffold(
          appBar: AppBar(
            actions: [
              IconButton(
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => PostData()),
                    );
                  },
                  icon: Icon(Icons.add))
            ],
          ),
          body: ListView.builder(
              itemCount: result?.length,
              itemBuilder: ((context, index) {
                return Column(
                  children: [
                    // ListTile(
                    //   title: Text(result![index].isCompleted.toString()),
                    //   trailing: IconButton(
                    //       onPressed: () {
                    //         showDialog(
                    //             context: context,
                    //             builder: (context) {
                    //               return AlertDialog(
                    //                 title: Text('edit text'),
                    //                 content: TextField(
                    //                   controller: edittt,
                    //                 ),
                    //                 actions: [
                    //                   ElevatedButton(
                    //                       onPressed: () {
                    //                         setState(() {
                    //                           ApiService().putData(
                    //                               isCompleted: edittt.text);
                    //                         });
                    //                       },
                    //                       child: Text('edit'))
                    //                 ],
                    //               );
                    //             });
                    //       },
                    //       icon: Icon(Icons.edit)),
                    // ),
                    // ListTile(
                    //   //   leading: Text(result![index].userId.toString()),
                    //   title: Text(result![index].title.toString()),
                    //   trailing: IconButton(
                    //       onPressed: () {
                    //         showDialog(
                    //             context: context,
                    //             builder: (context) {
                    //               return AlertDialog(
                    //                 title: Text('edit text'),
                    //                 content: TextField(
                    //                   controller: titleee,
                    //                 ),
                    //                 actions: [
                    //                   ElevatedButton(
                    //                       onPressed: () {
                    //                         setState(() {
                    //                           ApiService()
                    //                               .putData(title: titleee.text);
                    //                         });
                    //                       },
                    //                       child: Text('edit'))
                    //                 ],
                    //               );
                    //             });
                    //       },
                    //       icon: Icon(Icons.edit)),
                    // ),
                    ListTile(
                      leading: Text(result![index].id.toString()),
                      title: Text(result![index].title.toString()),
                      trailing: IconButton(
                          onPressed: () {
                            showDialog(
                                context: context,
                                builder: (context) {
                                  return AlertDialog(
                                    title: Text('edit text'),
                                    content: Column(
                                      children: [
                                        TextField(
                                          controller: idddd,
                                          decoration: InputDecoration(
                                              hintText:
                                                  result![index].id.toString()),
                                        ),
                                        TextField(
                                          controller: titleee,
                                          decoration: InputDecoration(
                                              hintText: result![index]
                                                  .title
                                                  .toString()),
                                        )
                                      ],
                                    ),
                                    actions: [
                                      ElevatedButton(
                                          onPressed: () {
                                            setState(() {
                                              ApiService().putData(
                                                  id: idddd.text,
                                                  title: titleee.text);
                                            });
                                          },
                                          child: Text('edit'))
                                    ],
                                  );
                                });
                          },
                          icon: Icon(Icons.edit)),
                    )
                  ],
                );
              })),
        ),
      ),
    );
  }
}
