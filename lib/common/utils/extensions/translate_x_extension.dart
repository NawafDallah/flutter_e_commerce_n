import '../../../config/localization/app_localizations.dart';
import 'package:flutter/material.dart';

extension Translate on String {
  String tr(BuildContext context) {
    return AppLocalizations.of(context)!.translate(this);
  }
}
