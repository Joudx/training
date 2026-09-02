import 'package:flutter/material.dart';
import '../../constants/app_constants.dart';
import '../../l10n/app_localizations.dart';
import '../../theme/app_theme.dart';
import '../../utils/service_donate.dart';
import '../../widgets/service_detail_scaffold.dart';

class MeatDistributionScreen extends StatelessWidget {
  const MeatDistributionScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context)!;
    return ServiceDetailScaffold(
      title: l10n.freshmeat,
      subtitle: l10n.distributingmeatneedyfamilies,
      description: l10n.freshmeatdescription,
      imagePath: AppImages.meat,
      accentColor: AppTheme.meat,
      ctaLabel: l10n.donateforproject,
      onDonate: serviceDonateAction(context),
    );
  }
}
