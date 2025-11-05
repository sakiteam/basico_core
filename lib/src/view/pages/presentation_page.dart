import 'package:basico_core/src/data/utilities/poster_utility.dart';
import 'package:basico_core/src/view/widgets/custom_app_bar.dart';
import 'package:basico_core/src/view/widgets/poster.dart';
import 'package:basico_core/src/view/widgets/process_bottom_bar.dart';
import 'package:flutter/material.dart';

import '../../logic/utils/navigation_utils.dart';
import '../widgets/presentation_terms.dart';

class BasicoPresentationPage extends StatefulWidget {
  final String title;
  final List<PosterUtility> steps;
  final void Function() onTermsAccepted;
  final String termsLink;
  final String termsImage;
  final Widget? leading;

  const BasicoPresentationPage({
    super.key,
    required this.title,
    required this.steps,
    required this.onTermsAccepted,
    required this.termsLink,
    required this.termsImage,
    this.leading,
  });

  @override
  State<BasicoPresentationPage> createState() => _BasicoPresentationPageState();
}

class _BasicoPresentationPageState extends State<BasicoPresentationPage> {
  int _index = 0;
  final _controller = PageController();

  @override
  void initState() {
    super.initState();

    _controller.addListener(() {
      final currentIndex = _controller.page?.round() ?? 0;

      if (_index != currentIndex) {
        setState(() {
          _index = currentIndex;
        });
      }
    });
  }

  @override
  void dispose() {
    _controller.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(
        title: widget.title,
        leading: widget.leading,
      ),
      body: Column(
        children: [
          Expanded(
            child: PageView(
              controller: _controller,
              children: widget.steps.map((e) {
                return Center(
                  child: SingleChildScrollView(
                    child: Poster(
                      image: e.image,
                      title: e.title,
                      description: e.description,
                    ),
                  ),
                );
              }).toList(),
            ),
          ),
          ProcessBottomBar(
            index: _index,
            controller: _controller,
            onCompleted: () {
              showSheet(
                context: context,
                builder: (_) {
                  return BasicoPresentationTerms(
                    title: widget.title,
                    onAccepted: widget.onTermsAccepted,
                    image: widget.termsImage,
                    link: widget.termsLink,
                  );
                },
              );
            },
            completionLabel: "Commencer",
          ),
        ],
      ),
    );
  }
}
