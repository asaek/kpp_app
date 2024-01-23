import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../../helpers/commons_providers/commons_providers.dart';
import '../../../../helpers/madre_lienzo_page/madre_lienzo_page.dart';

class TituloBanner extends StatelessWidget {
  final String titulo;

  const TituloBanner({super.key, required this.titulo});
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      bottom: false,
      child: SizedBox(
        height: 50,
        width: double.infinity,
        child: Banner(titulo: titulo),
      ),
    );
  }
}

class Banner extends StatelessWidget {
  final String titulo;

  const Banner({
    super.key,
    required this.titulo,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 20),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          const IconoBanner(),
          Text(
            titulo,
            style: TextStyle(
              color: Provider.of<ThemesTrajesProvider>(context, listen: false)
                  .getThemeTrajeObjeto
                  .terceroColor,
              fontSize: 35,
              fontWeight: FontWeight.w600,
            ),
          ),
        ],
      ),
    );
  }
}

class IconoBanner extends StatelessWidget {
  const IconoBanner({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      child: Image.asset('assets/btn_aleatorio.png'),
      onTap: () {
        final trajeSiguiente =
            Provider.of<MadreLienzoPageProviders>(context, listen: false)
                .mostrarToastYActualizarTraje();

        // PaginationControl.forward();
        Provider.of<ThemesTrajesProvider>(context, listen: false)
            .setThemeTrajeObjeto = trajeSiguiente;
      },
    );
  }
}
