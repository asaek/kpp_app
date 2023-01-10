import 'package:flutter/material.dart';

class LoadingGIF1 extends StatelessWidget {
  const LoadingGIF1({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Image.asset(
      'assets/loadings/kyaryLoading_1.gif',
      height: double.infinity,
      fit: BoxFit.cover,
    );
  }
}

class LoadingGIF2 extends StatelessWidget {
  const LoadingGIF2({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Image.asset(
      'assets/loadings/kyaryLoading_2.gif',
      height: double.infinity,
      fit: BoxFit.cover,
    );
  }
}

class LoadingGIF3 extends StatelessWidget {
  const LoadingGIF3({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Image.asset(
      'assets/loadings/kyaryLoading_3.gif',
      height: double.infinity,
      fit: BoxFit.cover,
    );
  }
}
