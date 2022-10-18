import 'package:flutter/material.dart';

class CustomAppBar extends StatelessWidget with PreferredSizeWidget {
  final String title;
  const CustomAppBar({
    Key? key,
    required this.title,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: Colors.transparent,
      elevation: 0,
      title: Center(
        child: Container(
            color: Colors.transparent,
            padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
            child: Text(title,
                style: const TextStyle(
                    color: Colors.black,
                    fontWeight: FontWeight.bold,
                    fontSize: 24,
                    fontFamily: 'Helvetica'))),
      ),
      iconTheme: IconThemeData(color: Color(0xFFEF3651)),
      actions: [
        IconButton(
            onPressed: () {
              Navigator.pushNamed(context, '/wishlist');
            },
            icon: Icon(
              Icons.favorite,
              color: Colors.red,
            ))
      ],
    );
  }

  @override
  // TODO: implement preferredSize
  Size get preferredSize => Size.fromHeight(50);
}
