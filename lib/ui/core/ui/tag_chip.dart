import 'dart:ui';

import 'package:compass_app/ui/core/themes/colors.dart';
import 'package:flutter/material.dart';

class TagChip extends StatelessWidget {
  const TagChip({
    super.key,
    required this.tag,
    this.fontSize = 10,
    this.height = 20,
    this.chipColor,
    this.onChipColor
  });

  final String tag;

  final double fontSize;
  final double height;
  final Color? chipColor;
  final Color? onChipColor;

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(height / 2),
      child: BackdropFilter(
        filter: ImageFilter.blur(sigmaX: 3, sigmaY: 3),
        child: DecoratedBox(
          decoration: BoxDecoration(
            color: chipColor
                ?? Theme.of(context).extension<TagChipTheme>()?.chipColor
                ?? AppColors.whiteTransparent
          )),
      ),
    );
  }
}

class TagChipTheme extends ThemeExtension<TagChipTheme> {
  final Color chipColor;
  final Color onChipColor;

  TagChipTheme({required this.chipColor, required this.onChipColor});

  @override
  ThemeExtension<TagChipTheme> copyWith({
    Color? chipColor,
    Color? onChipColor
  }) {
    return TagChipTheme(
      chipColor: chipColor ?? this.chipColor,
      onChipColor: onChipColor ?? this.onChipColor
    );
  }

  @override
  ThemeExtension<TagChipTheme> lerp(
      covariant ThemeExtension<TagChipTheme> other,
      double t
  ) {
    if (other is! TagChipTheme) {
      return this;
    }
    return TagChipTheme(
      chipColor: Color.lerp(chipColor, other.chipColor, t) ?? chipColor,
      onChipColor: Color.lerp(onChipColor, other.onChipColor, t) ?? onChipColor
    );
  }
}