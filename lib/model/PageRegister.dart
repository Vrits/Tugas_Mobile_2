import 'package:api/model/PageResponse.dart';
import 'package:api/model/RegisterResponse.dart';
import 'package:flutter/material.dart';

class PageRegister extends StatefulWidget {
  const PageRegister({Key? key}) : super(key: key);

  @override
  State<PageRegister> createState() => _PageRegisterState();
}

class _PageRegisterState extends State<PageRegister> {
  RegisterResponse? registerResponse = null;
  TextEditingController nameController = TextEditingController();
  TextEditingController jobController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Register Screen'),
      ),
      body: Column(
        children: [
          Container(
            padding: EdgeInsets.only(left: 10, right: 10),
            width: double.infinity,
            child: Column(
              children: [
                SizedBox(height: 10),
                TextField(
                  controller: nameController,
                  decoration: InputDecoration(
                    hintText: 'Enter your name',
                    labelText: 'Name',
                    border: OutlineInputBorder(),
                  ),
                ),
                SizedBox(height: 10),
                TextField(
                  controller: jobController,
                  decoration: InputDecoration(
                    hintText: 'Enter your Job',
                    labelText: 'Job',
                    border: OutlineInputBorder(),
                  ),
                ),
                SizedBox(height: 10),
                Container(
                  height: 50,
                  width: double.infinity,
                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.red,
                    ),
                    onPressed: () {
                      RegisterResponse.connectToAPI(
                              nameController.text, jobController.text)
                          .then((value) {
                        registerResponse = value;
                        setState(() {});
                      });
                    },
                    child: Text('Submit'),
                  ),
                ),
                SizedBox(height: 10),
                Text(registerResponse == null
                    ? 'No Data'
                    : registerResponse!.id +
                        ' | ' +
                        registerResponse!.name +
                        ' | ' +
                        registerResponse!.job +
                        ' | ' +
                        registerResponse!.createdAt),
                Container(
                  height: 50,
                  width: double.infinity,
                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.red,
                    ),
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => PageResponse()),
                      );
                    },
                    child: Text('GET'),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
