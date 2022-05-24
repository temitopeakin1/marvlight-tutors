import 'package:flutter/material.dart';

class ImageBanner extends StatelessWidget {
  final String _assetPath;

  ImageBanner(this._assetPath);

  @override
  Widget build(BuildContext context) {
    return Container(
        constraints: BoxConstraints.expand(
          height: 260.0,
          width: 100.0,
        ),
        child: Image.asset(
          _assetPath,
          fit: BoxFit.cover,
        ));
  }
}
