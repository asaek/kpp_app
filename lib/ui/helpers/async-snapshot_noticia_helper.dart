import 'package:flutter/material.dart';
import 'package:kyari_app/ui/common/atoms/H2_Text.dart';

Widget asyncSnapshotNoticiaPropiashelper(AsyncSnapshot snapshot) {
  Widget element = const SizedBox();

  if (snapshot.hasError) {
    element = H2(text: 'Error : ${snapshot.error.toString()}');
  } else if (!snapshot.hasData) {
    element = Image.asset(
      'assets/loadings/kyaryLoading_2.gif',
      height: double.infinity,
      fit: BoxFit.cover,
    );
  }
  return element;
}
