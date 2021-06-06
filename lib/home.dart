import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'products.dart';

class MyHome extends StatefulWidget {
  @override
  _MyHomeState createState() => _MyHomeState();
}

class _MyHomeState extends State<MyHome> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0.5,
        title: Text('Online Store'),
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

        // title: Text('hello'),
      ),
      drawer: MyDrawer(),
      body: Container(
        padding: EdgeInsets.all(10),
        child: SingleChildScrollView(
          child: Column(
            children: [
              Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
                SizedBox(height: 2),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 3),
                  child: TextField(
                    decoration: InputDecoration(
                        hintText: 'Search Here',
                        // border: OutlineInputBorder(),
                        suffixIcon: Icon(Icons.search)),
                  ),
                )
              ]),
              SizedBox(height: 20),
              SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                padding: EdgeInsets.only(bottom: 20),
                child: Row(
                  children: [
                    buildCategory("Accessories"),
                    buildCategory("Clothing"),
                    buildCategory('Jackets'),
                    buildCategory('Shoes'),
                    buildCategory('Undergarments'),
                    buildCategory('Men'),
                    buildCategory('Women'),
                  ],
                ),
              ),
              Column(
                children: [
                  Container(
                    padding: EdgeInsets.all(3),
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(10),
                      child: Image(
                        image: AssetImage('assets/images/promotion.png'),
                        // height: 70,
                      ),
                    ),
                  ),
                  Container(
                    padding: EdgeInsets.all(3),
                    margin: EdgeInsets.only(top: 15),
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(6),
                      child: Image(
                        image: AssetImage('assets/images/deal.png'),
                        // height: 70,
                      ),
                    ),
                  ),
                ],
              ),
              Container(
                padding: EdgeInsets.symmetric(horizontal: 3, vertical: 10),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Container(
                          margin: EdgeInsets.only(bottom: 10),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              Text('Flash Sale '),
                              Icon(
                                Icons.card_giftcard,
                                color: Colors.red,
                              )
                            ],
                          ),
                        ),
                        Row(
                          children: [
                            Text('Ends in '),
                            Text(' 218 days 00 : 19 : 59')
                          ],
                        )
                      ],
                    ),
                    Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [Text('See all')],
                    )
                  ],
                ),
              ),
              myproducts[0],
              myproducts[1],
              myproducts[2]
            ],
          ),
        ),
      ),
    );
  }
}

// drawer

class MyDrawer extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Container(
        child: ListView(
          padding: EdgeInsets.zero,
          children: [
            DrawerHeader(
                padding: EdgeInsets.zero,
                child: UserAccountsDrawerHeader(
                  margin: EdgeInsets.zero,
                  accountName: Text('Anas Aqeel'),
                  accountEmail: Text('anasaqeel.5555@gmail.com'),
                  currentAccountPicture: CircleAvatar(
                    backgroundImage: NetworkImage(
                        'https://image.shutterstock.com/image-photo/casually-handsome-confident-young-man-260nw-439433326.jpg'),
                  ),
                )),
            buildListTile(Icon(Icons.home), 'Home', true, context),
            buildListTile(
                Icon(Icons.card_travel_outlined), 'Cart', false, context),
            buildListTile(
                Icon(Icons.notifications), 'Notification', false, context),
            buildListTile(
                Icon(Icons.account_circle), 'Account', false, context),
            buildListTile(Icon(Icons.logout), 'Logout', false, context),
          ],
        ),
      ),
    );
  }
}

Widget buildCategory(String txt) {
  return Container(
    padding: EdgeInsets.symmetric(vertical: 6, horizontal: 5),
    margin: EdgeInsets.symmetric(horizontal: 5),
    decoration: BoxDecoration(
        color: Colors.black54, borderRadius: BorderRadius.circular(3)),
    child: Row(
      // mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text('$txt',
            textWidthBasis: TextWidthBasis.parent,
            style: TextStyle(
              fontSize: 14,
              color: Colors.white,
            ),
            softWrap: false,
            maxLines: 1,
            overflow: TextOverflow.ellipsis)
      ],
    ),
  );
}

Widget buildListTile(Widget icn, String txt, bool enb, BuildContext context) {
  return ListTile(
    leading: icn,
    title: Text('$txt'),
    trailing: txt == 'Account' ? Icon(Icons.edit) : null,
    selected: enb,
    onTap: () {
      Navigator.pushNamed(context, '/$txt');
    },
    selectedTileColor: Colors.black12,
  );
}
