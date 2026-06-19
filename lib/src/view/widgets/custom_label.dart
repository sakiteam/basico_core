import 'custom_alert.dart';
import 'package:flutter/material.dart';
import 'package:defer_pointer/defer_pointer.dart';
import 'package:basico_core/l10n/basico_localizations.dart';

class CustomLabel extends StatelessWidget {
  final String text;
  final bool isRequired;
  final String? helpTitle;
  final String? helpDescription;
  final bool center;
  final TextStyle? style;

  const CustomLabel(
    this.text, {
    super.key,
    this.isRequired = false,
    this.helpTitle,
    this.helpDescription,
    this.center = false,
    this.style,
  });

  @override
  Widget build(BuildContext context) {
    const double helpButtonAreaSize = 40;

    return Padding(
      padding: const EdgeInsets.only(bottom: 4.0),
      child: Row(
        spacing: 2,
        mainAxisAlignment:
            center ? MainAxisAlignment.center : MainAxisAlignment.start,
        children: [
          Text(
            text.toUpperCase(),
            style: style ??
                TextStyle(
                  color: Theme.of(context).primaryColor,
                  fontWeight: FontWeight.bold,
                  fontSize: 12,
                ),
          ),
          if (isRequired)
            Container(
              height: 12,
              alignment: Alignment.topCenter,
              child: const Icon(Icons.emergency, size: 8, color: Colors.red),
            ),
          if (!center) const Spacer(),
          if (helpDescription != null)
            SizedBox(
              width: 12,
              height: 12,
              child: OverflowBox(
                maxWidth: double.infinity,
                maxHeight: double.infinity,
                child: DeferPointer(
                  child: GestureDetector(
                    behavior: HitTestBehavior.opaque,
                    onTap: () {
                      showDialog(
                        context: context,
                        builder: (_) {
                          return CustomAlert(
                            title: helpTitle ?? text,
                            image: "assets/images/help.svg",
                            description: helpDescription ?? "",
                            simple: true,
                            acceptationText:
                                BasicoLocalizations.of(context)!.ok,
                          );
                        },
                      );
                    },
                    child: SizedBox(
                      width: helpButtonAreaSize,
                      height: helpButtonAreaSize,
                      child: Transform.scale(
                        scale: 1.5,
                        child: Icon(
                          Icons.help,
                          size: 12,
                          color: Colors.grey.shade700,
                        ),
                      ),
                    ),
                  ),
                ),
              ),
            ),
        ],
      ),
    );
  }
}
