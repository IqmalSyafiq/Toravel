import 'package:flutter/material.dart';

class BottomAppbar extends StatelessWidget {
  const BottomAppbar({
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
            ElevatedButton(
              onPressed: () {
                Navigator.pushNamed(context, '/');
              },
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Icon(
                    Icons.add_rounded,
                  ),
                  Text('items'),
                ],
              ),
            ),
            ElevatedButton(
              onPressed: () {
                Navigator.pushNamed(context, '/checkout');
              },
              child: Text(
                'CHECKOUT',
              ),
            ),
          ],
        ),
      ),
    );
  }
}
