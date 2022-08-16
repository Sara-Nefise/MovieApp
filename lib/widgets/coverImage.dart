import 'package:flutter/material.dart';
import 'package:kartal/kartal.dart';

import 'package:movie_app/core/constant/apiConstants.dart';
import 'package:movie_app/model/populerMovie_model.dart';
import 'package:widgetbook_annotation/widgetbook_annotation.dart';

class CoverImage extends StatelessWidget {
  String url;
  CoverImage({
    Key? key,
    required this.url,
    required this.result,
  }) : super(key: key);

  dynamic result;

  @override
  Widget build(BuildContext context) {
    return Hero(
      tag: '${result?.id}',
      child: Container(
          width: context.dynamicWidth(1),
          height: context.dynamicHeight(0.3),
          decoration: BoxDecoration(
            image: DecorationImage(
                filterQuality: FilterQuality.low,
                fit: BoxFit.cover,
                image: NetworkImage(url)),
          )),
    );
  }
}
