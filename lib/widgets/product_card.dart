import 'package:flutter/material.dart';

class ProductCArd extends StatelessWidget {
  const ProductCArd(
      {super.key,
      required this.title,
      required this.price,
      required this.image,
      required this.backgroundColor});
  final String title;
  final String price;
  final String image;
  final Color backgroundColor;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.all(20),
      padding: const EdgeInsets.all(15),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20),
        color: backgroundColor,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(title, style: Theme.of(context).textTheme.titleMedium),
          SizedBox(height: 10),
          Text('\$$price', style: Theme.of(context).textTheme.bodySmall),
          SizedBox(height: 10),
          Center(
            child: Image(
              image: AssetImage(
                image,
              ),
              height: 150,
              width: 250,
            ),
          ),
          SizedBox(height: 10),
        ],
      ),
    );
  }
}
