import 'package:flutter/material.dart';

import 'poster.dart';

class EmptinessPoster extends StatelessWidget {
  final String? title;
  final String? description;
  final String? image;
  final Widget? content;

  const EmptinessPoster({
    super.key,
    this.title,
    this.description,
    this.image,
    this.content,
  });

  @override
  Widget build(BuildContext context) {
    return Center(
      child: SingleChildScrollView(
        child: Poster(
          image: image ?? "assets/images/emptiness.svg",
          title: title ?? "Aucune donnée enregistrée !",
          description: description ??
              "Cette section s'actualisera automatiquement lorsqu'une nouvelle donnée sera ajoutée !",
          content: content,
        ),
      ),
    );
  }
}
