import 'package:flutter/material.dart';
import '../../view/widgets/custom_alert.dart';

Future<T?> pushPage<T extends Object?>(
  BuildContext context,
  Widget page,
) async {
  return Navigator.push<T>(
    context,
    MaterialPageRoute<T>(builder: (_) => page),
  );
}

Future<T?> replacePage<T extends Object?, TO extends Object?>(
  BuildContext context,
  Widget page,
) async {
  return Navigator.pushReplacement<T, TO>(
    context,
    MaterialPageRoute<T>(builder: (_) => page),
  );
}

Future<T?> pushPageAndRemoveAll<T extends Object?>(
  BuildContext context,
  Widget page,
) async {
  return Navigator.pushAndRemoveUntil<T>(
    context,
    MaterialPageRoute(
      builder: (context) => page,
    ),
    (route) => false,
  );
}

void popPage(BuildContext context) {
  Navigator.pop(context);
}

Future<T?> showSheet<T>({
  required BuildContext context,
  required Widget Function(BuildContext) builder,
  bool draggable = true,
  bool dismissible = true,
}) {
  return showModalBottomSheet<T>(
    context: context,
    builder: builder,
    isScrollControlled: true,
    isDismissible: dismissible,
    enableDrag: draggable,
    backgroundColor: Colors.transparent,
  );
}

Future<void> showFormEditionDialog(BuildContext context) {
  return showDialog(
    context: context,
    builder: (_) {
      return CustomAlert(
        title: "Avertissement",
        description:
            "Voulez-vous vraiment abandonner le remplissage du formulaire ?",
        image: "assets/images/warning.svg",
        color: Colors.red,
        acceptationText: "Quitter",
        onAccepted: () {
          popPage(context);
        },
      );
    },
  );
}
