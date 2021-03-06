import 'package:dessert_app/models/dessert.dart';
import 'package:flutter/material.dart';

class DessertCardWidget extends StatelessWidget {
  DessertCardWidget({required this.dessert, required this.onPressed});

  final VoidCallback? onPressed;
  final Dessert dessert;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onPressed,
      child: Stack(children: [
        Container(
          width: 300,
          height: 300,
          margin: const EdgeInsets.only(right: 15, left: 25),
          decoration: BoxDecoration(
              color: dessert.color.withOpacity(0.8),
              borderRadius: BorderRadius.circular(22),
              boxShadow: [
                BoxShadow(
                  offset: const Offset(5, 10),
                  blurRadius: 20,
                  color: dessert.color.withOpacity(0.5),
                ),
              ]),
          child: Stack(
            children: [
              Container(
                padding: const EdgeInsets.only(
                  left: 35,
                  top: 35,
                  right: 35,
                ),
                child: Text(
                  dessert.name,
                  style: TextStyle(
                    fontSize: 18,
                    color: Colors.white,
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ),
            ],
            // ),
          ),
          // ),
        ),
        Container(
          height: 300,
          width: 400,
          margin: EdgeInsets.only(top: 85, right: 60),
          decoration: BoxDecoration(
            image: DecorationImage(
              image: NetworkImage(dessert.imgUrl),
            ),
          ),
        )
      ]),
    );
  }
}
