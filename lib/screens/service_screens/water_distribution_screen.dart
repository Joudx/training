import 'package:flutter/material.dart';
import '../../constants/app_constants.dart';
import '../../l10n/app_localizations.dart';
import '../../theme/app_theme.dart';
import '../../utils/service_donate.dart';
import '../../widgets/service_detail_scaffold.dart';

class WaterDistributionScreen extends StatelessWidget {
  const WaterDistributionScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context)!;
    return ServiceDetailScaffold(
      title: l10n.waterdistribution,
      subtitle: l10n.providingdrinkingwaterneed,
      description: l10n.waterdistribituindescription,
      imagePath: AppImages.water,
      accentColor: AppTheme.water,
      ctaLabel: l10n.donateforproject,
      onDonate: serviceDonateAction(context),
    );
  }
}
