import 'package:flutter/material.dart';
import '../../constants/app_constants.dart';
import '../../l10n/app_localizations.dart';
import '../../theme/app_theme.dart';
import '../../utils/service_donate.dart';
import '../../widgets/service_detail_scaffold.dart';

class FoodBasketsScreen extends StatelessWidget {
  const FoodBasketsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context)!;
    return ServiceDetailScaffold(
      title: l10n.foodbaskets,
      subtitle: l10n.distributionoffoodbaskets,
      description: l10n.distributionbasketsnecessities,
      imagePath: AppImages.foodBaskets,
      accentColor: AppTheme.baskets,
      ctaLabel: l10n.donateforproject,
      onDonate: serviceDonateAction(context),
    );
  }
}
