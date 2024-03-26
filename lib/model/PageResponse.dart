import 'package:api/model/UserResponse.dart';
import 'package:flutter/material.dart';

class PageResponse extends StatefulWidget {
  const PageResponse({super.key});

  @override
  State<PageResponse> createState() => _PageResponseState();
}

class _PageResponseState extends State<PageResponse> {
  UserResponse? userResponse = null;
  List<UserResponse> userList = [];

  @override
  void initState() {
    print('Init state');
    UserResponse.getUsersList("1").then((value) {
      userList = value;
      print(value[0]);
      setState(() {});
    });
    super.initState();
  }

  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Daftar User'),
      ), // AppBar
      body: ListView.builder(
          itemCount: userList.length,
          itemBuilder: (context, index) {
            return InkWell(
              child: Card(
                child: Row(children: [
                  Image(
                      width: 100,
                      height: 100,
                      image: NetworkImage(userList[index].avatar)), // Image
                  Container(
                    padding: EdgeInsets.only(left: 10, right: 10),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(userList[index].name),
                        Text(userList[index].email),
                      ],
                    ), // Column
                  ) // Container
                ]), // ROW
              ), // Card
            ); // InkWell
          }), // Listview.builder
    ); // Scaffold
  }
}
