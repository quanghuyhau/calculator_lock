import 'package:calculator_lock/generated/assets.dart';
import 'package:calculator_lock/generated/l10n.dart';
import 'package:calculator_lock/presentation/common/load_image/load_image.dart';
import 'package:calculator_lock/utilities/style/style.dart';
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

class EmptyWidget extends StatelessWidget {
  final String? description;
  final LoadImage? iconWidget;
  final TextStyle? descriptionTextStyle;

  const EmptyWidget({
    Key? key,
    this.description,
    this.iconWidget,
    this.descriptionTextStyle,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    theme.registerNotifyUpdated(context);

    return Container(
      alignment: Alignment.center,
      padding: const EdgeInsets.only(bottom: 24),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          iconWidget ??
              // Lottie.asset(
              //   Assets.animNoData,
              //   width: 120,
              //   height: 120,
              // ),
          const SizedBox(
            height: 24,
          ),
          Text(
            description ?? S.current.no_data,
            textAlign: TextAlign.center,
            style: descriptionTextStyle ??
                theme.font.bodyBold.copyWith(color: theme.color.b20),
          ),
        ],
      ),
    );
  }
}
