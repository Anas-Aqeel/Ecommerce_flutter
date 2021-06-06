import 'package:flutter/material.dart';
// import 'package:flutter/rendering.dart';
import 'home.dart';

class MyNotifications extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: MyDrawer(),
      appBar: AppBar(
        title: Text('Notifications'),
        centerTitle: true,
        elevation: 0.5,
        actions: [
          Padding(
            padding: const EdgeInsets.only(right: 10.0),
            child: IconButton(
              onPressed: () {},
              icon: Icon(Icons.notifications),
            ),
          )
        ],

        // title: Text('hello'),
      ),
      body: Container(
        padding: EdgeInsets.only(top: 10),
        child: SingleChildScrollView(
          scrollDirection: Axis.vertical,
          child: Column(
            children: [
              buildNotification(
                  'Amazon',
                  'Free shipping on millions of items. Get the best of Shopping and Entertainment with Prime.',
                  'https://cdn3.iconfinder.com/data/icons/cute-flat-social-media-icons-3/512/amazon.png'),
              buildNotification(
                  'Facebook',
                  'Log into Facebook to start sharing and connecting with your friends, family, and people you know.',
                  'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSKmg_AVDfhAGZJmGRvSCkPRXPzial5VCa0ak37eW547vKjn1NBRscH53TJPY7EIQGRBaA&usqp=CAU'),
              buildNotification(
                  'Google',
                  "Search the world's information, including webpages, images, videos and more. ",
                  'https://cdn.iconscout.com/icon/free/png-256/google-372-437925.png'),
              buildNotification(
                  'Muhammad Ali Mughal',
                  '"Lorem ipsum dolor sit amet, consecr adipiscing elit',
                  'https://yt3.ggpht.com/ytc/AAUvwniZyxh9BMvwJF6LORCMb5jdt9DXzRBOPXt4Uv_lMQ=s900-c-k-c0x00ffffff-no-rj'),
              buildNotification(
                  'M.Jack',
                  'Sorry for delay. I will be back soon.',
                  'https://images.unsplash.com/photo-1557862921-37829c790f19?ixid=MnwxMjA3fDB8MHxzZWFyY2h8MXx8bWFufGVufDB8fDB8fA%3D%3D&ixlib=rb-1.2.1&w=1000&q=80'),
              buildNotification(
                  'Mr.Khalid',
                  'Log into Facebook to start sharing and connecting with your friends, family, and people you know.',
                  'https://img.freepik.com/free-photo/portrait-masculinity-portrait-handsome-young-bearded-man-while-standing-against-grey-wall_231208-7829.jpg?size=626&ext=jpg&ga=GA1.2.1377562154.1621728000'),
              buildNotification(
                  'Mr.Khalid',
                  'Log into Facebook to start sharing and connecting with your friends, family, and people you know.',
                  'https://img.freepik.com/free-photo/portrait-masculinity-portrait-handsome-young-bearded-man-while-standing-against-grey-wall_231208-7829.jpg?size=626&ext=jpg&ga=GA1.2.1377562154.1621728000'),
              buildNotification(
                  'M.Jack',
                  'Sorry for delay. I will be back soon.',
                  'https://images.unsplash.com/photo-1557862921-37829c790f19?ixid=MnwxMjA3fDB8MHxzZWFyY2h8MXx8bWFufGVufDB8fDB8fA%3D%3D&ixlib=rb-1.2.1&w=1000&q=80'),
              buildNotification(
                  'Amazon',
                  'Free shipping on millions of items. Get the best of Shopping and Entertainment with Prime.',
                  'https://cdn3.iconfinder.com/data/icons/cute-flat-social-media-icons-3/512/amazon.png'),
              buildNotification(
                  'Facebook',
                  'Log into Facebook to start sharing and connecting with your friends, family, and people you know.',
                  'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSKmg_AVDfhAGZJmGRvSCkPRXPzial5VCa0ak37eW547vKjn1NBRscH53TJPY7EIQGRBaA&usqp=CAU'),
              buildNotification(
                  'Google',
                  "Search the world's information, including webpages, images, videos and more. ",
                  'https://cdn.iconscout.com/icon/free/png-256/google-372-437925.png'),
              buildNotification(
                  'Muhammad Ali Mughal',
                  '"Lorem ipsum dolor sit amet, consecr adipiscing elit',
                  'https://yt3.ggpht.com/ytc/AAUvwniZyxh9BMvwJF6LORCMb5jdt9DXzRBOPXt4Uv_lMQ=s900-c-k-c0x00ffffff-no-rj'),
            ],
          ),
        ),
      ),
    );
  }
}

Widget buildNotification(String username, String text, String url) {
  String txt2;
  if (text.length > 60) {
    txt2 = text.replaceRange(55, text.length, '...');
  } else {
    txt2 = text;
  }

  return Tooltip(
    message: text,
    child: ListTile(
      leading: CircleAvatar(
        backgroundImage: NetworkImage('$url'),
      ),
      title: Text('$username'),
      subtitle: Text('$txt2'),
      isThreeLine: false,
      trailing: Icon(Icons.more_vert),
    ),
  );
}
