import 'package:basico_core/src/logic/services/local_storage_service.dart';
import 'package:basico_core/src/view/widgets/custom_sheet.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:url_launcher/url_launcher.dart';

import '../../logic/utils/navigation_utils.dart';
import '../../logic/utils/spacing_utils.dart';
import 'custom_button.dart';
import 'poster.dart';

class BasicoPresentationTerms extends StatefulWidget {
  final String title;
  final void Function() onAccepted;
  final String image;
  final String link;

  const BasicoPresentationTerms({
    super.key,
    required this.title,
    required this.onAccepted,
    required this.image,
    required this.link,
  });

  @override
  State<BasicoPresentationTerms> createState() =>
      _BasicoPresentationTermsState();
}

class _BasicoPresentationTermsState extends State<BasicoPresentationTerms> {
  bool _confirm = false;

  @override
  Widget build(BuildContext context) {
    final bottomPadding = MediaQuery.of(context).padding.bottom;

    return CustomSheet(
      child: SingleChildScrollView(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            const SizedBox(height: regularSpacing),
            Poster(
              image: widget.image,
              title: "Une seconde s'il vous plaît !",
              padding: const EdgeInsets.all(regularSpacing).copyWith(
                bottom: 0,
              ),
              safeAreaBottom: false,
            ),
            Center(
              child: Padding(
                padding: const EdgeInsets.all(regularSpacing),
                child: RichText(
                  textAlign: TextAlign.center,
                  text: TextSpan(
                    style: TextStyle(
                      fontSize: 16,
                      color: Colors.grey,
                      fontFamily: GoogleFonts.assistant().fontFamily,
                    ),
                    children: [
                      TextSpan(
                        text:
                            // "Avant de commencer à utiliser ${widget.title} en toute sérénité, vous devez lire et accepter ",
                            "Avant de commencer, veuillez consulter ",
                        // style:  TextStyle(color: Colors.black),
                      ),
                      TextSpan(
                        text: "les conditions générales d'utilisation (CGU)",
                        style: TextStyle(
                          color: Theme.of(context).primaryColor,
                        ),
                        recognizer: TapGestureRecognizer()
                          ..onTap = () {
                            launchUrl(
                              Uri.parse(widget.link),
                            );
                          },
                      ),
                      const TextSpan(
                        text: " de la plateforme !",
                      ),
                    ],
                  ),
                ),
              ),
            ),
            Container(
              height: 62,
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child: Material(
                clipBehavior: Clip.antiAlias,
                color: _confirm ? Colors.grey.shade50 : Colors.white,
                shape: RoundedRectangleBorder(
                  side: const BorderSide(width: 0.5, color: Colors.grey),
                  borderRadius: BorderRadius.circular(8),
                ),
                child: CheckboxListTile(
                  contentPadding: const EdgeInsets.fromLTRB(16, 2, 8, 0),
                  title: Text(
                    "J'ai vraiment lu les CGU de ${widget.title}",
                    overflow: TextOverflow.ellipsis,
                    style: TextStyle(
                      color: _confirm ? Theme.of(context).primaryColor : null,
                    ),
                  ),
                  value: _confirm,
                  onChanged: (value) {
                    setState(() {
                      _confirm = !_confirm;
                    });
                  },
                ),
              ),
            ),
            const SizedBox(height: 16),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                CustomButton(
                  width: 150,
                  label: "Refuser",
                  type: CustomButtonType.flat,
                  onPressed: () {
                    popPage(context);
                  },
                ),
                CustomButton(
                  width: 150,
                  label: "Accepter",
                  onPressed: _confirm
                      ? () {
                          popPage(context);

                          LocalStorageService.welcomed = true;

                          widget.onAccepted();
                        }
                      : null,
                ),
              ],
            ),
            SizedBox(height: bottomPadding + regularSpacing),
          ],
        ),
      ),
    );
  }
}
