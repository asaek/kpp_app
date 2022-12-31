import 'package:flutter/material.dart';
import 'package:kyari_app/ui/helpers/helpers.dart';
import 'package:provider/provider.dart';

class TarjetaNoticias extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Consumer<NoticiasProvider>(
      builder: (context, noticiasProvider, child) {
        return AnimatedSwitcher(
          duration: const Duration(milliseconds: 300),
          transitionBuilder: (widgetListBuilder, animation) => FadeTransition(
            opacity: animation,
            child: widgetListBuilder,
          ),
          child: (noticiasProvider.getCargando == true)
              ? Image.asset(
                  'assets/loadings/kyaryLoading_2.gif',
                  height: double.infinity,
                  fit: BoxFit.cover,
                )
              : ListView.builder(
                  itemCount: 100,
                  scrollDirection: Axis.vertical,
                  physics: const BouncingScrollPhysics(),
                  itemBuilder: (context, index) {
                    return Text(index.toString());
                  },
                ),
        );
      },
    );
  }
}
