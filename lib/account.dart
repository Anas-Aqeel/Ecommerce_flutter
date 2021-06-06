import 'home.dart';
import 'package:flutter/material.dart';

class MyAccount extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: MyDrawer(),
      appBar: AppBar(
        title: Text('Account Details'),
        centerTitle: true,
        actions: [
          Padding(
            padding: const EdgeInsets.only(right: 10.0),
            child: IconButton(
              onPressed: () {
                Navigator.pushNamed(context, '/Notification');
              },
              icon: Icon(Icons.notifications),
            ),
          )
        ],
      ),
      body: Container(
        padding: EdgeInsets.symmetric(vertical: 12, horizontal: 5),
        child: SingleChildScrollView(
          child: Column(
            children: [
              Center(
                child: Column(
                  children: [
                    Container(
                      height: 100,
                      width: 100,
                      child: CircleAvatar(
                        backgroundImage: NetworkImage(
                            'https://media.istockphoto.com/photos/portrait-of-smiling-handsome-man-in-blue-tshirt-standing-with-crossed-picture-id1045886560?k=6&m=1045886560&s=612x612&w=0&h=hXrxai1QKrfdqWdORI4TZ-M0ceCVakt4o6532vHaS3I='),
                      ),
                    ),
                    SizedBox(
                      height: 5,
                    ),
                    Text('Anas Aqeel'),
                    SizedBox(
                      height: 5,
                    ),
                    Text('anasaqeel.5555@gmail.com')
                  ],
                ),
              ),
              SizedBox(
                height: 15,
              ),
              Container(
                padding: EdgeInsets.symmetric(vertical: 10, horizontal: 7),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(left: 5),
                      child: Text(
                        'Account Details',
                        style: TextStyle(
                            fontSize: 20, fontWeight: FontWeight.bold),
                      ),
                    ),
                    ListTile(
                      title: Text('User Name'),
                      subtitle: Text('Anas Aqeel'),
                      trailing: Icon(Icons.edit),
                    ),
                    ListTile(
                      title: Text('Email'),
                      subtitle: Text('anasaqeel.5555@gmail.com'),
                      // leading: Icon(Icons.email),
                    ),
                    ListTile(
                      title: Text('Phone'),
                      subtitle: Text('+9212345678'),
                    ),
                    ListTile(
                      title: Text('Address'),
                      subtitle: Text('Karachi Random, Street House No. 127'),
                    ),
                    ListTile(
                      title: Text('Gender'),
                      subtitle: Text('Male'),
                    ),
                    ListTile(
                      title: Text('Date of Birth'),
                      subtitle: Text('September 20, 2005'),
                    ),
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
