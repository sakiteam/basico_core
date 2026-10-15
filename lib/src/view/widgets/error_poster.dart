import 'package:flutter/material.dart';

import 'poster.dart';

class ErrorPoster extends StatelessWidget {
  final String? title;
  final String? description;
  final String? image;
  final Widget? content;
  final bool ignoreDescription;

  const ErrorPoster({
    super.key,
    this.title,
    this.description,
    this.image,
    this.content,
    this.ignoreDescription = false,
  });

  @override
  Widget build(BuildContext context) {
    return Center(
      child: SingleChildScrollView(
        child: Poster(
          image: image ?? "assets/images/failure.svg",
          title: title ?? "Une erreur est survenue !",
          description: ignoreDescription
              ? null
              : (description ??
                    "Veuillez fermer cette section de l'application puis relancez-la une nouvelle fois s'il vous plaît !"),
          content: content,
        ),
      ),
    );
  }
}
