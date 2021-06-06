// import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:favorite_button/favorite_button.dart';

var products = [
  'assets/images/product1.jpg',
  'assets/images/product2.jpg',
  'assets/images/product3.jpg',
  'assets/images/product4.jpg',
  'assets/images/product5.jpg',
  'assets/images/product6.jpg',
];

var myproducts = [
  Row(
    children: [
      CardBuilder(
        clr: 'black',
        ctg: 'Leather jacket',
        img: products[0],
        price: "200",
        siz: '3',
        stars: '5',
        txt: 'A black warm jacket',
      ),
      CardBuilder(
        clr: 'black',
        ctg: 'Summer T-shrit',
        img: products[1],
        price: "200",
        siz: '3',
        stars: '5',
        txt: 'Summer T-shirt',
      )
    ],
  ),
  Row(
    children: [
      CardBuilder(
        clr: 'Darkblue',
        ctg: 'Sport shoes',
        img: products[2],
        price: "100",
        siz: 'Medium',
        stars: '5',
        txt: 'Formal shoes for running',
      ),
      CardBuilder(
        clr: 'Orange',
        ctg: 'Shopping paper bags',
        img: products[3],
        price: "200",
        siz: 'JNormal',
        stars: '4',
        txt: 'Shopping paper bags',
      )
    ],
  ),
  Row(
    children: [
      CardBuilder(
        clr: 'Black',
        ctg: 'Handyman tool kit',
        img: products[4],
        price: "1500",
        siz: 'Handleable',
        stars: '4',
        txt:
            'Handyman tool kit, many wrenches and screwdrivers, pilers and other tools for any types of repair or construction works. Repairman tools',
      ),
      CardBuilder(
        clr: 'Black',
        ctg: 'Electronic wrist watch',
        img: products[5],
        price: "800",
        siz: 'Small',
        stars: '4',
        txt: 'Black electronic wrist watch and smart fitness',
      )
    ],
  ),
];

class StarDisplay extends StatelessWidget {
  final int value;
  const StarDisplay({Key key, this.value = 5})
      : assert(value != null),
        super(key: key);
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: List.generate(5, (index) {
        return Icon(
          index < value ? Icons.star : Icons.star_border,
        );
      }),
    );
  }
}

class CardBuilder extends StatefulWidget {
  final String ctg;
  final String clr;
  final String price;
  final String siz;
  final String img;
  final String txt;
  final String stars;

  CardBuilder(
      {Key key,
      this.txt,
      this.price,
      this.clr,
      this.ctg,
      this.siz,
      this.img,
      this.stars})
      : super(key: key);

  @override
  _CardBuilderState createState() => _CardBuilderState();
}

class _CardBuilderState extends State<CardBuilder> {
  String txtShorter() {
    if (widget.txt.length > 20) {
      return widget.txt.replaceRange(17, widget.txt.length, '...');
    } else {
      return widget.txt;
    }
  }

  void addToCart(ctr, clr, price, size, prd) {
    demoProducts.add(Cart(
        category: ctr, color: clr, price: price, product: prd, size: size));
  }

  bool isadded = false;
  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Container(
        padding: EdgeInsets.all(10),
        child: Column(
          children: [
            Container(
                height: 220,
                child: ClipRRect(
                  borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(10),
                      topRight: Radius.circular(10)),
                  child: Stack(
                    children: [
                      Positioned(
                        top: 0,
                        bottom: 1,
                        child: Image(
                            fit: BoxFit.cover,
                            image: AssetImage(
                              '${widget.img}',
                            )),
                      ),
                      Positioned(
                        right: 0,
                        child: FavoriteButton(
                          isFavorite: false,
                          iconSize: 40,
                          valueChanged: () {},
                        ),
                      )
                    ],
                  ),
                )),
            Container(
              decoration: BoxDecoration(
                color: Colors.black12,
              ),
              child: Row(
                children: [
                  Container(
                    padding: EdgeInsets.all(8),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Tooltip(
                            message: '${widget.txt}',
                            child: Text('${txtShorter()}')),
                        SizedBox(height: 6),
                        Row(
                          children: [
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text('${widget.price} \$'),
                                SizedBox(height: 8),
                                Container(
                                    child: IconTheme(
                                  data: IconThemeData(
                                    color: Colors.amber,
                                    size: 13,
                                  ),
                                  child: Row(
                                    children: [
                                      StarDisplay(value: 5),
                                      SizedBox(
                                        width: 10,
                                      ),
                                      Text('(5)')
                                    ],
                                  ),
                                )),
                                SizedBox(height: 5),
                                Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    SizedBox(
                                      width: 5,
                                    ),
                                    Ink(
                                      child: InkWell(
                                        highlightColor: Colors.black12,
                                        onTap: () {
                                          isadded = !isadded;
                                          isadded
                                              ? addToCart(
                                                  widget.ctg,
                                                  widget.clr,
                                                  widget.price,
                                                  widget.siz,
                                                  widget.img)
                                              : setState(() {});
                                          setState(() {});
                                        },
                                        child: AnimatedContainer(
                                          duration: Duration(milliseconds: 300),
                                          padding: EdgeInsets.all(10),
                                          alignment: Alignment.center,
                                          width: isadded ? 65 : 100,
                                          decoration: BoxDecoration(
                                              color: Colors.black,
                                              borderRadius:
                                                  BorderRadius.circular(8)
                                              // borderRadius: BorderRadius.circular(100)
                                              ),
                                          child: isadded
                                              ? Text('Added')
                                              : Text('Add To Cart'),
                                        ),
                                      ),
                                    )
                                  ],
                                )
                              ],
                            ),
                          ],
                        )
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class Cart {
  String product;
  int quan = 1;
  String price;
  String color = 'Default';
  String size = 'Default';
  String category;
  Cart(
      {this.product,
      this.price,
      this.color,
      this.category,
      this.size,
      this.quan});
}

List<Cart> demoProducts = [];
