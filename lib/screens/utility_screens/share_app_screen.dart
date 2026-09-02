import 'package:flutter/material.dart';
import '../../constants/app_constants.dart';
import '../../l10n/app_localizations.dart';
import '../../theme/app_layout.dart';
import '../../theme/app_theme.dart';
import '../../utils/app_launchers.dart';

class ShareAppScreen extends StatelessWidget {
  const ShareAppScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context)!;
    final theme = Theme.of(context);
    final pad = AppLayout.pagePadding(AppLayout.sizeOf(context).width);
    final shareText = '${l10n.shareMessage}\n${AppOrg.website}';

    return Scaffold(
      appBar: AppBar(title: Text(l10n.shareapp)),
      body: ResponsiveBody(
        child: Padding(
          padding: EdgeInsets.all(pad + 8),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                padding: const EdgeInsets.all(22),
                decoration: BoxDecoration(
                  color: theme.colorScheme.primaryContainer,
                  shape: BoxShape.circle,
                ),
                child: const Icon(
                  Icons.share_outlined,
                  size: 56,
                  color: AppTheme.primary,
                ),
              ),
              const SizedBox(height: 22),
              Text(
                l10n.shareapp,
                textAlign: TextAlign.center,
                style: theme.textTheme.headlineSmall?.copyWith(
                  fontWeight: FontWeight.w800,
                ),
              ),
              const SizedBox(height: 10),
              Text(
                l10n.shareMessage,
                textAlign: TextAlign.center,
                style: theme.textTheme.bodyLarge?.copyWith(
                  color: theme.colorScheme.onSurfaceVariant,
                  height: 1.6,
                ),
              ),
              const SizedBox(height: 12),
              SelectableText(
                AppOrg.website,
                style: theme.textTheme.titleMedium?.copyWith(
                  color: AppTheme.primary,
                  fontWeight: FontWeight.w700,
                ),
              ),
              const SizedBox(height: 28),
              FilledButton.icon(
                onPressed: () => copyText(
                  context,
                  shareText,
                  successMessage: l10n.linkCopied,
                ),
                icon: const Icon(Icons.copy_all_outlined),
                label: Text(l10n.copyLink),
              ),
              const SizedBox(height: 12),
              OutlinedButton.icon(
                onPressed: () => launchAppUri(context, AppOrg.website),
                icon: const Icon(Icons.open_in_new),
                label: Text(l10n.visitWebsite),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
