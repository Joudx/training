import 'package:flutter/material.dart';
import '../../data/auth_session.dart';
import '../../l10n/app_localizations.dart';
import '../../theme/app_layout.dart';
import '../../theme/app_theme.dart';

class DonationHistoryScreen extends StatelessWidget {
  const DonationHistoryScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context)!;
    final theme = Theme.of(context);
    final pad = AppLayout.pagePadding(AppLayout.sizeOf(context).width);

    return Scaffold(
      appBar: AppBar(title: Text(l10n.mydonationrecord)),
      body: ResponsiveBody(
        child: Padding(
          padding: EdgeInsets.all(pad),
          child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                  padding: const EdgeInsets.all(20),
                  decoration: BoxDecoration(
                    color: theme.colorScheme.primaryContainer,
                    shape: BoxShape.circle,
                  ),
                  child: const Icon(
                    Icons.history,
                    size: 48,
                    color: AppTheme.primary,
                  ),
                ),
                const SizedBox(height: 20),
                Text(
                  AuthSession.instance.user != null
                      ? '${l10n.welcomeUser} ${AuthSession.instance.user!.name}'
                      : l10n.mydonationrecord,
                  textAlign: TextAlign.center,
                  style: theme.textTheme.headlineSmall?.copyWith(
                    fontWeight: FontWeight.w800,
                  ),
                ),
                const SizedBox(height: 10),
                Text(
                  l10n.partThreeSoon,
                  textAlign: TextAlign.center,
                  style: theme.textTheme.bodyLarge?.copyWith(
                    color: theme.colorScheme.onSurfaceVariant,
                    height: 1.6,
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
