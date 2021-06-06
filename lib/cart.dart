import 'home.dart';
import 'products.dart';
import 'package:flutter/material.dart';

class MyCart extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Cart'),
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
      drawer: MyDrawer(),
      body: Container(
        padding: EdgeInsets.all(5),
        child: SingleChildScrollView(
          scrollDirection: Axis.vertical,
          child: Column(
            children: demoProducts
                .map((e) => BuildCartProduct(
                      clr: e.color,
                      itm: e.category,
                      price: e.price,
                      qun: 1,
                      url: e.product,
                      size: e.size,
                    ))
                .toList(),
          ),
        ),
      ),
    );
  }
}

class BuildCartProduct extends StatefulWidget {
  final String itm;
  final String size;
  final String clr;
  final int qun;
  final String price;
  final String url;
  const BuildCartProduct(
      {Key key, this.clr, this.itm, this.price, this.qun, this.size, this.url})
      : super(key: key);

  @override
  _BuildCartProductState createState() => _BuildCartProductState();
}

class _BuildCartProductState extends State<BuildCartProduct> {
  @override
  Widget build(BuildContext context) {
    int qun1 = widget.qun;
    return Container(
      padding: EdgeInsets.symmetric(vertical: 5, horizontal: 7),
      margin: EdgeInsets.all(5),
      decoration: BoxDecoration(
          color: Colors.black12, borderRadius: BorderRadius.circular(5)),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Container(
            height: 113,
            width: 100,
            decoration: BoxDecoration(
                image: DecorationImage(
                    fit: BoxFit.cover, image: AssetImage('${widget.url}'))),
          ),
          SizedBox(
            width: 10,
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text('${widget.itm}'),
              SizedBox(height: 5),
              Text('Size:  ${widget.size}'),
              SizedBox(height: 5),
              Text('Color:  ${widget.clr}'),
              SizedBox(height: 5),
              Row(
                children: [
                  Text('Quantity:  $qun1'),
                  SizedBox(
                    width: 80,
                  ),
                  Row(
                    children: [
                      InkWell(
                        onTap: () {
                          setState(() {
                            qun1 += 1;
                            debugPrint('$qun1');
                          });
                        },
                        child: Icon(
                          Icons.add,
                          size: 18,
                        ),
                      ),
                      SizedBox(
                        width: 15,
                      ),
                      InkWell(
                        onTap: () {},
                        child: Icon(
                          Icons.remove,
                          size: 15,
                        ),
                      )
                    ],
                  )
                ],
              ),
              SizedBox(height: 5),
              Row(
                children: [
                  Container(
                    height: 36,
                    alignment: Alignment.center,
                    padding: EdgeInsets.symmetric(horizontal: 50.0),
                    child: InkWell(
                        onTap: () {}, child: Text('\$ ${widget.price}')),
                    decoration: BoxDecoration(
                        color: Colors.black26,
                        borderRadius: BorderRadius.circular(6)),
                  ),
                  SizedBox(width: 15),
                  InkWell(
                    child: Ink(
                      width: 40,
                      height: 36,
                      decoration: BoxDecoration(
                          color: Colors.red[800],
                          borderRadius: BorderRadius.circular(6)),
                      // padding: EdgeInsets.symmetric(horizontal: 2),
                      // color: Colors.black26,
                      child: Icon(
                        Icons.close,
                        color: Colors.white,
                      ),
                    ),
                  )
                ],
              )
            ],
          )
        ],
      ),
    );
  }
}
