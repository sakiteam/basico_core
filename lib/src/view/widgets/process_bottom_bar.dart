import 'package:basico_core/src/view/widgets/custom_page_indicator.dart';
import 'package:flutter/material.dart';

import '../../logic/utils/spacing_utils.dart';
import 'bottom_bar.dart';
import 'custom_button.dart';

const _buttonWidth = 135.0;

class ProcessBottomBar extends StatelessWidget {
  final int index;
  final PageController controller;
  final void Function() onCompleted;
  final String completionLabel;
  final bool Function(int index)? canGoForward;
  final bool Function(int index)? canGoBackward;
  final bool loading;

  const ProcessBottomBar({
    super.key,
    required this.index,
    required this.controller,
    required this.onCompleted,
    required this.completionLabel,
    this.canGoBackward,
    this.canGoForward,
    this.loading = false,
  });

  @override
  Widget build(BuildContext context) {
    final firstPage = index == 0;
    final lastPage = index == 2;

    final forwardPossible = canGoForward?.call(index) ?? true;
    final backwardPossible = canGoBackward?.call(index) ?? true;

    return BottomBar(
      child: Padding(
        padding: const EdgeInsets.symmetric(
          horizontal: regularSpacing,
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            firstPage
                ? const SizedBox(
                    width: _buttonWidth,
                  )
                : CustomButton(
                    type: CustomButtonType.flat,
                    width: _buttonWidth,
                    label: "Précédent",
                    onPressed: backwardPossible
                        ? () {
                            controller.previousPage(
                              duration: const Duration(milliseconds: 250),
                              curve: Curves.linear,
                            );
                          }
                        : null,
                  ),
            CustomPageIndicator(
              count: 3,
              controller: controller,
            ),
            lastPage
                ? CustomButton(
                    loading: loading,
                    width: _buttonWidth,
                    label: completionLabel,
                    onPressed: forwardPossible ? onCompleted : null,
                  )
                : CustomButton(
                    type: CustomButtonType.flat,
                    width: _buttonWidth,
                    label: "Suivant",
                    onPressed: forwardPossible
                        ? () {
                            controller.nextPage(
                              duration: const Duration(milliseconds: 250),
                              curve: Curves.linear,
                            );
                          }
                        : null,
                  ),
          ],
        ),
      ),
    );
  }
}
