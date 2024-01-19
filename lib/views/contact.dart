import 'package:flutter/material.dart';

class Contact extends StatefulWidget {
  const Contact({super.key});

  @override
  State<Contact> createState() => _ContactState();
}

class _ContactState extends State<Contact> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: double.infinity,
        color: Color(0xff03061B),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            CircleAvatar(
              backgroundImage: AssetImage('images/sazzad.jpg'),
              radius: 70,
            ),
            Text(
              "Sazzad Hasan",
              style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                  color: Colors.white),
            ),
            Text(
              "Flutter Developer",
              style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                  color: Colors.white),
            ),
            // Red divider
            SizedBox(
              height: 20,
              width: 300,
              child: Divider(
                color: Colors.red,
                thickness: 5,
              ),
            ),

            // Now instead of taking row , we can use CARD
            Card(
              margin: EdgeInsets.symmetric(horizontal: 10, vertical: 20),
              child: ListTile(
                leading: Icon(Icons.call),
                title: Text(
                  "01621110109",
                  style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
                ),
              ),
            ),
            Card(
              margin: EdgeInsets.symmetric(horizontal: 10, vertical: 10),
              child: ListTile(
                leading: Icon(Icons.email),
                title: Text(
                  "sazzan610@gmail.com",
                  style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
                ),
              ),
            ),
            SizedBox(
              height: 15,
            ),
            ElevatedButton(
              onPressed: () {
                showModalBottomSheet(
                    context: context,
                    builder: (context) {
                      return Container(
                        height: 300,
                        width: double.infinity,
                        decoration: BoxDecoration(
                          color: Colors.orange,
                          borderRadius: (BorderRadius.circular(50)),
                        ),
                        child: Column(
                          children: [
                            ListTile(
                              leading: Icon(Icons.mail, size: 30),
                              trailing: Text("Hired Via Mail",
                                  style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      fontSize: 20)),
                            ),
                            ListTile(
                              leading: Icon(
                                Icons.facebook,
                                size: 30,
                              ),
                              trailing: Text(
                                "Hired Via Facebook",
                                style: TextStyle(
                                    fontWeight: FontWeight.bold, fontSize: 20),
                              ),
                            ),
                            ListTile(
                              leading: Icon(
                                Icons.message,
                                size: 30,
                              ),
                              trailing: Text("Hired Via SMS",
                                  style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      fontSize: 20)),
                            ),
                          ],
                        ),
                      );
                    });
              },
              child: Text(
                "Hire Developer",
                style: TextStyle(
                    fontSize: 12,
                    fontWeight: FontWeight.bold,
                    color: Colors.white),
              ),
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.red, // Background color
                padding: EdgeInsets.symmetric(
                    horizontal: 20,
                    vertical: 12), // Adjust padding for better spacing
                shape: RoundedRectangleBorder(
                  borderRadius:
                      BorderRadius.circular(10), // Add rounded corners
                ),
                elevation: 4, // Add elevation for a subtle shadow
              ),
            ),
          ],
        ),
      ),
    );
  }
}
