import 'package:flutter/material.dart';

class tdCard extends StatelessWidget {
  final String name;
  final int date;
  final String month;

  tdCard({required this.name, required this.date, required this.month});

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Container(
      width: size.width / 8,
      height: 91.0,
      margin: EdgeInsets.all(7.0),
      decoration: BoxDecoration(
        color: Color(0xFFE8B2A6),
        border: Border.all(
          color: Color(0xFFE8B2A6),
          width: 2.0,
        ),
        borderRadius: BorderRadius.circular(18.0),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            '$name',
            style: TextStyle(
              color: Colors.white,
              fontSize: 12.0,
              fontFamily: 'Product Sans',
            ),
          ),
          Text(
            '$date',
            style: TextStyle(
              color: Colors.white,
              fontSize: 24.0,
              fontFamily: 'Product Sans',
              fontWeight: FontWeight.bold,
            ),
          ),
          Text(
            '$month',
            style: TextStyle(
              color: Colors.white,
              fontSize: 12.0,
              fontFamily: 'Product Sans',
            ),
          ),
        ],
      ),
    );
  }
}
