import 'package:flutter/material.dart';
import 'package:student_directory_app_flutter/services.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  TextEditingController nameController = TextEditingController();
  TextEditingController phoneController = TextEditingController();
  TextEditingController addressController = TextEditingController();
  final formkey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.pinkAccent[100],
        foregroundColor: Colors.white,
        title: Text(
          'Student Directory',
          style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          showDialog(
            context: context,
            builder: (context) {
              return AlertDialog(
                backgroundColor: Colors.pink[50],
                title: Text(
                  'Add Student Data',
                  style: TextStyle(fontWeight: FontWeight.bold),
                ),
                content: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    TextFormField(
                      controller: nameController,
                      decoration: InputDecoration(
                        fillColor: Colors.white,
                        filled: true,
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(12),
                        ),
                        label: Text('Name'),
                      ),
                    ),
                    TextFormField(
                      controller: phoneController,
                      decoration: InputDecoration(
                        fillColor: Colors.white,
                        filled: true,
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(12),
                        ),
                        label: Text('Phone Number'),
                      ),
                    ),
                    TextFormField(
                      controller: addressController,
                      decoration: InputDecoration(
                        fillColor: Colors.white,
                        filled: true,
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(12),
                        ),
                        label: Text('Student Address'),
                      ),
                    ),

                    ElevatedButton(
                      onPressed: () {
                        screen(
                          name: nameController.text,
                          phone: phoneController.text,
                          address: addressController.text,
                          context: context,
                        );
                      },
                      child: Text(
                        'Add student',
                        style: TextStyle(color: Colors.white),
                      ),
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.pinkAccent[100],
                      ),
                    ),
                  ],
                ),
              );
            },
          );
        },
        backgroundColor: Colors.pinkAccent[100],
        foregroundColor: Colors.white,
        child: Icon(Icons.add),
      ),
      body: StreamBuilder(
        stream: fetchdata(),
        builder: (context, snapshot) {
          if (!snapshot.hasData) {
            return Center(child: CircularProgressIndicator());
          }
          final studentdata = snapshot.data!.docs;
          return ListView.builder(
            itemCount: studentdata.length,
            itemBuilder: (context, index) {
              return ListTile(title: Text(studentdata[index]['Name']));
            },
          );
        },
      ),
    );
  }
}
