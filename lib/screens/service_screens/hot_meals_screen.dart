import 'package:flutter/material.dart';
import '../../constants/app_constants.dart';
import '../../l10n/app_localizations.dart';
import '../../theme/app_theme.dart';
import '../../utils/service_donate.dart';
import '../../widgets/service_detail_scaffold.dart';

class HotMealsScreen extends StatelessWidget {
  const HotMealsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context)!;
    return ServiceDetailScaffold(
      title: l10n.hotmeals,
      subtitle: l10n.providinghotmealsneed,
      description: l10n.providinghotmealsneeddescription,
      imagePath: AppImages.hotMeals,
      accentColor: AppTheme.hotMeals,
      ctaLabel: l10n.donatenow,
      onDonate: serviceDonateAction(context),
    );
  }
}
