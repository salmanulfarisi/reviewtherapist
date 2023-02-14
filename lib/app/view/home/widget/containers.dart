import 'package:flutter/cupertino.dart';

Widget imageContainer({required String image}) {
  return Container(
    height: 200,
    width: double.infinity,
    decoration: BoxDecoration(
      borderRadius: BorderRadius.circular(10),
      image: DecorationImage(
        image: NetworkImage(image),
        fit: BoxFit.cover,
      ),
    ),
  );
}
