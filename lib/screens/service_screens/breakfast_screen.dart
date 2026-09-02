import 'package:flutter/material.dart';
import '../../constants/app_constants.dart';
import '../../l10n/app_localizations.dart';
import '../../theme/app_theme.dart';
import '../../utils/service_donate.dart';
import '../../widgets/service_detail_scaffold.dart';

class BreakfastScreen extends StatelessWidget {
  const BreakfastScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context)!;
    return ServiceDetailScaffold(
      title: l10n.iftarforafastingperson,
      subtitle: l10n.providinggrandmosque,
      description: l10n.providingiftarmeals,
      imagePath: AppImages.breakfast,
      accentColor: AppTheme.iftar,
      ctaLabel: l10n.donateforproject,
      onDonate: serviceDonateAction(context),
    );
  }
}
