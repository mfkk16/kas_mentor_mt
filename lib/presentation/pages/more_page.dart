import 'package:flutter/material.dart';

import '../../domain/constants/assets.dart';

class MorePage extends StatelessWidget {
  const MorePage({super.key});

  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      body: Image.asset(Assets.comingSoon,fit: BoxFit.fitWidth),
    );
  }
}
