import 'package:flutter/material.dart';

buildImageWidget(String image) {
  return Padding(
    padding: const EdgeInsets.all(10),
    child: Column(
      children: [
        CircleAvatar(
          radius: 50,
          backgroundImage: AssetImage(
            image,
          ),
        ),
        Padding(
          padding: const EdgeInsets.only(top: 12),
          child: Text(
            "اسم الفصل",
            style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
          ),
        )
      ],
    ),
  );
}