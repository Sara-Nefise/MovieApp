import 'package:flutter/material.dart';
import 'package:kartal/kartal.dart';

import 'package:movie_app/core/init/theme/color/color_theme.dart';

class featureContainer extends StatelessWidget {
  String? text;
  featureContainer({
    Key? key,
    required this.text,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 3),
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(15),
          border: Border.all(color: AppColors().red, width: 2.5)),
      child: Text('$text',
          style: context.textTheme.bodyText1?.copyWith(fontSize: 18)),
    );
  }
}
