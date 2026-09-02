import 'package:flutter/material.dart';
import '../../constants/app_constants.dart';
import '../../l10n/app_localizations.dart';
import '../../theme/app_theme.dart';
import '../../utils/service_donate.dart';
import '../../widgets/service_detail_scaffold.dart';

class FoodSurplusScreen extends StatelessWidget {
  const FoodSurplusScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context)!;
    return ServiceDetailScaffold(
      title: l10n.surplusfood,
      subtitle: l10n.distributingfooddescroption,
      description: l10n.surplusfooddescription,
      imagePath: AppImages.foodSurplus,
      accentColor: AppTheme.surplus,
      ctaLabel: l10n.donatenow,
      onDonate: serviceDonateAction(context),
    );
  }
}
