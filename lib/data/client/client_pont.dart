import 'package:built_value/built_value.dart';
import 'package:flutter/material.dart' hide Builder;
import 'package:pont/images.dart';

part 'client_pont.g.dart';

extension ClientPontTypeEx on ClientPontType {
  Widget getImage({required double width, required double height}) {
    switch (this) {
      case ClientPontType.casual:
        return PontImage.pontCasual(width: width, height: height);
      case ClientPontType.classic:
        return PontImage.pontClassic(width: width, height: height);
      case ClientPontType.hype:
        return PontImage.pontHype(width: width, height: height);
      case ClientPontType.platinum:
        return PontImage.pontPlatinum(width: width, height: height);
    }
  }
}

enum ClientPontType {
  casual,
  classic,
  hype,
  platinum,
}

abstract class ClientPont implements Built<ClientPont, ClientPontBuilder> {
  factory ClientPont([void Function(ClientPontBuilder) updates]) = _$ClientPont;

  ClientPont._();

  ClientPontType get type;

  String get name;

  String get description;

  String get history;

  int? get price;
}
