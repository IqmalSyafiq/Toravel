import 'package:flutter/material.dart';

class CustomNavBar extends StatelessWidget {
  const CustomNavBar({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BottomAppBar(
        color: Color(0XFFABB4BD),
        child: Container(
            height: 70,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                IconButton(
                    onPressed: () {},
                    icon: Icon(Icons.home_outlined, color: Colors.white)),
                IconButton(
                    onPressed: () {
                      Navigator.pushNamed(context, '/cart');
                    },
                    icon: Icon(Icons.shopping_cart_outlined,
                        color: Colors.white)),
                IconButton(
                    onPressed: () {},
                    icon: Icon(Icons.account_circle_outlined,
                        color: Colors.white))
              ],
            )));
  }
}
