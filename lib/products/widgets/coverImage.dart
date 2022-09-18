import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:kartal/kartal.dart';

class CoverImage extends StatelessWidget {
  final String url;
  final dynamic result;

  const CoverImage({
    Key? key,
    required this.url,
    required this.result,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Hero(
      tag: '${result?.id}',
      child: CachedNetworkImage(
        imageUrl: url,
        imageBuilder: (context, imageProvider) => Container(
          width: context.dynamicWidth(1),
          height: context.dynamicHeight(0.3),
          decoration: BoxDecoration(
            image: DecorationImage(
                filterQuality: FilterQuality.low,
                fit: BoxFit.cover,
                image: imageProvider),
          ),
        ),
        placeholder: (context, url) => Container(
          width: context.dynamicWidth(1),
          height: context.dynamicHeight(0.3),
          decoration: const BoxDecoration(
            image: DecorationImage(
                filterQuality: FilterQuality.low,
                fit: BoxFit.fill,
                image: AssetImage('assets/gifs/skeleton.gif')),
          ),
        ),
        errorWidget: (context, url, error) => const Icon(Icons.error),
      ),
    );
  }
}
