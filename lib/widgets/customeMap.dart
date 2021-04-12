import 'package:flutter/material.dart';

createRadius(cases) {
  try {
    final parseCases = double.parse(cases.toString());
    if (parseCases >= 1 && parseCases <= 5) {
      return 1000.0;
    } else if (parseCases >= 6.0 && parseCases <= 10.0) {
      return 3000.0;
    } else if (parseCases >= 11.0 && parseCases <= 20.0) {
      return 10000.0;
    } else if (parseCases >= 21.0 && parseCases <= 50.0) {
      return 20000.0;
    } else if (parseCases > 50.0) {
      return 30000.0;
    } else
      return 0.0;
  } catch (e) {
    return 0.0;
  }
}

createColor(cases) {
  // try {
  final parseCases = double.parse(cases.toString());
  if (parseCases >= 1 && parseCases <= 5) {
    return [
      Color.fromRGBO(13, 178, 188, 0.2),
      Color.fromRGBO(13, 178, 188, 0.3)
    ];
  } else if (parseCases >= 6.0 && parseCases <= 10.0) {
    return [Color.fromRGBO(103, 184, 0, 0.2), Color.fromRGBO(103, 184, 0, 0.3)];
  } else if (parseCases >= 11.0 && parseCases <= 20.0) {
    return [Color.fromRGBO(48, 55, 231, 0.2), Color.fromRGBO(48, 55, 231, 0.3)];
  } else if (parseCases >= 21.0 && parseCases <= 50.0) {
    return [
      Color.fromRGBO(231, 48, 125, 0.2),
      Color.fromRGBO(231, 48, 125, 0.3)
    ];
  } else if (parseCases > 50.0) {
    return [Color.fromRGBO(195, 18, 18, 0.2), Color.fromRGBO(195, 18, 18, 0.3)];
  } else
    return [
      Color.fromRGBO(236, 239, 231, 0.2),
      Color.fromRGBO(236, 239, 231, 0.3)
    ];

  // } catch (e) {
  //   return [null, null];
  // }
}
