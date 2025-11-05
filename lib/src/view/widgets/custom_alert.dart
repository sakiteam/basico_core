import 'dart:math';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import '../../logic/utils/navigation_utils.dart';
import '../../logic/utils/spacing_utils.dart';
import 'custom_button.dart';

const double width = 300;
final double height = width * (1 + sqrt(5)) / 2;

class CustomAlert extends StatelessWidget {
  final IconData? icon;
  final String title;
  final String description;
  final void Function()? onRejected;
  final void Function()? onAccepted;
  final bool closeAfterAcceptation;
  final bool closeAfterRejection;
  final Color? color;
  final String? acceptationText;
  final String? rejectionText;
  final String? image;
  final bool simple;

  const CustomAlert({
    super.key,
    this.icon,
    required this.title,
    required this.description,
    this.onRejected,
    this.onAccepted,
    this.closeAfterAcceptation = true,
    this.closeAfterRejection = true,
    this.color,
    this.acceptationText,
    this.rejectionText,
    this.image,
    this.simple = false,
  });

  @override
  Widget build(BuildContext context) {
    return Center(
      child: SizedBox(
        width: width,
        height: height,
        child: Material(
          color: Colors.white,
          clipBehavior: Clip.antiAlias,
          shape: RoundedRectangleBorder(
            // borderRadius: BorderRadius.zero,
            // side: BorderSide(),
            borderRadius: BorderRadius.circular(16),
          ),
          child: Column(
            children: [
              Container(
                width: width,
                height: width,
                alignment: Alignment.center,
                color: Colors.grey.shade100,
                child: image != null
                    ? SvgPicture.asset(image!)
                    : Icon(
                        icon,
                        size: 120,
                        color: Colors.grey,
                      ),
              ),
              const Divider(),
              Expanded(
                child: Container(
                  width: width,
                  padding: const EdgeInsets.all(regularSpacing),
                  child: Column(
                    children: [
                      Text(
                        title,
                        textAlign: TextAlign.center,
                        style: const TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 20,
                          color: Colors.black,
                        ),
                      ),
                      Expanded(
                        child: Center(
                          child: Text(
                            description,
                            textAlign: TextAlign.center,
                            style: const TextStyle(
                              // fontWeight: FontWeight.bold,
                              fontSize: 13,
                              color: Colors.grey,
                            ),
                          ),
                        ),
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        spacing: regularSpacing,
                        children: [
                          if (!simple)
                            Expanded(
                              flex: 1,
                              child: CustomButton(
                                backgroundColor: Colors.white,
                                foregroundColor: Colors.black,
                                onPressed: () {
                                  if (closeAfterRejection) {
                                    popPage(context);
                                  }

                                  onRejected?.call();
                                },
                                label: rejectionText ?? "Annuler",
                              ),
                            ),
                          Expanded(
                            flex: simple ? 0 : 1,
                            child: CustomButton(
                              width: 150,
                              backgroundColor: color,
                              onPressed: () {
                                if (closeAfterAcceptation) {
                                  popPage(context);
                                }

                                onAccepted?.call();
                              },
                              label: acceptationText ?? "Valider",
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
