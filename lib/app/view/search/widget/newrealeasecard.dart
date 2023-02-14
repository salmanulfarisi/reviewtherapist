import 'package:flutter/material.dart';

class NewRealeaseCard extends StatelessWidget {
  final String image;
  final String gameName;
  const NewRealeaseCard({Key? key, required this.image, required this.gameName})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 120,
      decoration: BoxDecoration(
        color: Colors.black38,
        borderRadius: BorderRadius.circular(10),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            height: 100,
            decoration: BoxDecoration(
                color: Colors.transparent,
                borderRadius: const BorderRadius.only(
                  topLeft: Radius.circular(10),
                  topRight: Radius.circular(10),
                ),
                image: DecorationImage(
                  image: NetworkImage(image),
                  fit: BoxFit.cover,
                )),
          ),
          const SizedBox(height: 5),
          Padding(
            padding: const EdgeInsets.only(left: 5),
            child: Text(
              gameName,
              style: const TextStyle(
                color: Colors.white,
                fontSize: 12,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          const SizedBox(height: 5),
        ],
      ),
    );
  }
}
