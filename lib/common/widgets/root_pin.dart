import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:wedding/extensions/context_extensions.dart';
import 'package:wedding/extensions/object_extensions.dart';

import '../../config/constants/gap_constants.dart';
import '../../config/typedefs.dart';
import '../tools/gradient_theme.dart';

class RootPin extends StatelessWidget {
  const RootPin({
    super.key,
    this.focus,
    required this.pinController,
    this.trailing,
    this.subtitle,
  });

  /// The TextEditingController.
  final TextEditingController pinController;

  /// The focus node.
  final FocusNode? focus;

  /// The trailing widget.
  final Widget? trailing;

  /// The subtitle.
  final Widget? subtitle;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Stack(
          children: [
            SizedBox(
              height: 50,
              child: ValueListenableBuilder(
                valueListenable: pinController,
                builder: (context, final TextEditingValue value, _) {
                  return Row(
                    children: [
                      ListView.separated(
                        scrollDirection: Axis.horizontal,
                        itemCount: 4,
                        shrinkWrap: true,
                        separatorBuilder: (context, final int index) {
                          return const SizedBox(width: 10);
                        },
                        itemBuilder: (context, final int index) {
                          // The pin value.
                          String? value;
                          if (index < pinController.text.length) {
                            value = pinController.text[index];
                          }
                          return _RootPinContainer(
                            key: ValueKey<String?>(value),
                            index: index,
                            pinController: pinController,
                            value: value,
                          );
                        },
                      ),
                      if (trailing != null) ...[
                        GapConstants.px20,
                        AnimatedOpacity(
                          opacity: value.text.length == 4 ? 1 : 0,
                          duration: const Duration(milliseconds: 500),
                          child: trailing,
                        ),
                      ]
                    ],
                  );
                },
              ),
            ),
            SizedBox(
              width: 230,
              child: TextFormField(
                focusNode: focus,
                controller: pinController,
                showCursor: false,
                keyboardType: TextInputType.number,
                inputFormatters: [
                  FilteringTextInputFormatter.digitsOnly,
                  LengthLimitingTextInputFormatter(4),
                ],
                enableInteractiveSelection: false,
                style: const TextStyle(color: Colors.transparent),
                decoration: const InputDecoration(filled: false),
              ),
            ),
          ],
        ),
        if (subtitle != null) ...[GapConstants.px10, subtitle!]
      ],
    );
  }
}

class _RootPinContainer extends StatefulWidget {
  const _RootPinContainer({
    super.key,
    required this.index,
    required this.pinController,
    required this.value,
  });

  final int index;
  final TextEditingController pinController;
  final String? value;

  @override
  State<_RootPinContainer> createState() => _RootPinContainerState();
}

class _RootPinContainerState extends State<_RootPinContainer> {
  /// The value.
  late String? value;

  /// The text reBuilder.
  ReBuilder? _builder;

  @override
  void initState() {
    value = widget.value;
    if (widget.value != null && widget.value!.isNotEmpty) {
      Future.delayed(const Duration(milliseconds: 500), () {
        _builder?.call(() => value = "✦");
      });
    }
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    const BorderRadius borderRadius = BorderRadius.all(Radius.circular(8));
    return AnimatedContainer(
      duration: const Duration(milliseconds: 300),
      width: 50,
      decoration: BoxDecoration(
        borderRadius: borderRadius,
        gradient: GradientTheme.of(context)
            .gradient
            .onlyIf<Gradient>(widget.pinController.text.length == widget.index),
      ),
      child: Center(
        child: Container(
          height: 45,
          width: 45,
          decoration: BoxDecoration(
            color: context.color.surface,
            borderRadius: borderRadius,
          ),
          child: Center(
            child: StatefulBuilder(builder: (context, final ReBuilder builder) {
              _builder = builder;
              return Text(
                value ?? "",
                style: context.text.headlineSmall,
              );
            }),
          ),
        ),
      ),
    );
  }
}
