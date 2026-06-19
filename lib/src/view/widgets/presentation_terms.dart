import 'package:basico_core/src/logic/services/local_storage_service.dart';
import 'package:basico_core/src/view/widgets/custom_sheet.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:basico_core/l10n/basico_localizations.dart';

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
              title: BasicoLocalizations.of(context)!.oneSecondPlease,
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
                        text: BasicoLocalizations.of(context)!
                            .beforeStartingPleaseConsult,
                      ),
                      TextSpan(
                        text: BasicoLocalizations.of(context)!.termsOfService,
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
                      TextSpan(
                        text: BasicoLocalizations.of(context)!.ofThePlatform,
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
                  borderRadius: BorderRadius.circular(16),
                ),
                child: CheckboxListTile(
                  contentPadding: const EdgeInsets.fromLTRB(16, 2, 8, 0),
                  title: Text(
                    BasicoLocalizations.of(context)!
                        .iHaveReadTheTerms(widget.title),
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
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: regularSpacing),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Expanded(
                    child: CustomButton(
                      width: 150,
                      label: BasicoLocalizations.of(context)!.refuse,
                      type: CustomButtonType.flat,
                      onPressed: () {
                        popPage(context);
                      },
                    ),
                  ),
                  regularGap,
                  Expanded(
                    child: CustomButton(
                      width: 150,
                      label: BasicoLocalizations.of(context)!.accept,
                      onPressed: _confirm
                          ? () {
                              popPage(context);

                              LocalStorageService.welcomed = true;

                              widget.onAccepted();
                            }
                          : null,
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(height: bottomPadding + regularSpacing),
          ],
        ),
      ),
    );
  }
}
