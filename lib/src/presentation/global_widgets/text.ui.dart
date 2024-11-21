import 'package:flutter/material.dart';
import 'package:prospa_assessment/src/presentation/resources/res.dart';

class TextUi extends StatelessWidget {
  const TextUi({
    this.data,
    super.key,
    this.color,
    this.maxLines,
    this.fontFamily,
    this.textAlign = TextAlign.left,
    this.isSelectable = false,
    this.height,
    this.letterSpacing,
    this.overflow,
    this.span,
    this.style = body2,
  }) : assert(
          data != null || span != null,
          'Either text data or span must be provided',
        );

  const TextUi.title1({
    this.data,
    super.key,
    this.color,
    this.maxLines,
    this.fontFamily,
    this.textAlign = TextAlign.left,
    this.isSelectable = false,
    this.height,
    this.letterSpacing,
    this.overflow,
    this.span,
    this.style = title1,
  });

  const TextUi.title2({
    this.data,
    super.key,
    this.color,
    this.maxLines,
    this.fontFamily,
    this.textAlign = TextAlign.left,
    this.isSelectable = false,
    this.height,
    this.letterSpacing,
    this.overflow,
    this.span,
    this.style = title2,
  });

  const TextUi.title3({
    this.data,
    super.key,
    this.color,
    this.maxLines,
    this.fontFamily,
    this.textAlign = TextAlign.left,
    this.isSelectable = false,
    this.height,
    this.letterSpacing,
    this.overflow,
    this.span,
    this.style = title3,
  });

  const TextUi.body1({
    this.data,
    super.key,
    this.color,
    this.maxLines,
    this.fontFamily,
    this.textAlign = TextAlign.left,
    this.isSelectable = false,
    this.height,
    this.letterSpacing,
    this.overflow,
    this.span,
    this.style = body1,
  });

  const TextUi.body2({
    this.data,
    super.key,
    this.color,
    this.maxLines,
    this.fontFamily,
    this.textAlign = TextAlign.left,
    this.isSelectable = false,
    this.height,
    this.letterSpacing,
    this.overflow,
    this.span,
    this.style = body2,
  });

  const TextUi.body3({
    this.data,
    super.key,
    this.color,
    this.maxLines,
    this.fontFamily,
    this.textAlign = TextAlign.left,
    this.isSelectable = false,
    this.height,
    this.letterSpacing,
    this.overflow,
    this.span,
    this.style = body3,
  });

  const TextUi.caption({
    this.data,
    super.key,
    this.color,
    this.maxLines,
    this.fontFamily,
    this.textAlign = TextAlign.left,
    this.isSelectable = false,
    this.height,
    this.letterSpacing,
    this.overflow,
    this.span,
    this.style = caption,
  });

  final String? data;
  final TextStyle style;
  final Color? color;
  final int? maxLines;
  final String? fontFamily;
  final TextAlign textAlign;
  final bool isSelectable;
  final double? height;
  final double? letterSpacing;
  final TextOverflow? overflow;
  final TextSpan? span;

  @override
  Widget build(BuildContext context) {
    final effectiveStyle = style.copyWith(
      color: color,
      letterSpacing: letterSpacing ?? style.letterSpacing,
      fontSize: style.fontSize,
      height: height ?? style.height ?? 1.5,
      fontFamily: fontFamily ?? style.fontFamily,
    );

    if (isSelectable) {
      if (span != null) {
        return SelectableText.rich(
          span!,
          textAlign: textAlign,
          textWidthBasis: TextWidthBasis.parent,
          maxLines: maxLines,
          style: effectiveStyle,
        );
      }

      return SelectableText(
        data ?? '',
        textAlign: textAlign,
        textWidthBasis: TextWidthBasis.parent,
        maxLines: maxLines,
        style: effectiveStyle,
      );
    }

    if (span != null) {
      return Text.rich(
        span!,
        textAlign: textAlign,
        textWidthBasis: TextWidthBasis.parent,
        maxLines: maxLines,
        overflow: overflow ?? TextOverflow.visible,
        softWrap: true,
        style: effectiveStyle,
      );
    }

    return Text(
      data ?? '',
      textAlign: textAlign,
      textWidthBasis: TextWidthBasis.parent,
      maxLines: maxLines,
      overflow: overflow ?? TextOverflow.visible,
      softWrap: true,
      style: effectiveStyle,
    );
  }
}
