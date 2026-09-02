import 'package:flutter/material.dart';
import '../../constants/app_constants.dart';
import '../../l10n/app_localizations.dart';
import '../../theme/app_layout.dart';
import '../../theme/app_theme.dart';
import '../../utils/app_launchers.dart';

class ContactScreen extends StatelessWidget {
  const ContactScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context)!;
    final theme = Theme.of(context);
    final isAr = Localizations.localeOf(context).languageCode == 'ar';
    final pad = AppLayout.pagePadding(AppLayout.sizeOf(context).width);

    return Scaffold(
      appBar: AppBar(title: Text(l10n.callus)),
      body: ResponsiveBody(
        child: ListView(
          padding: EdgeInsets.all(pad),
          children: [
            Text(
              l10n.callus,
              style: theme.textTheme.titleLarge?.copyWith(
                fontWeight: FontWeight.w800,
              ),
            ),
            const SizedBox(height: 6),
            Text(
              l10n.contactSubtitle,
              style: theme.textTheme.bodyMedium?.copyWith(
                color: theme.colorScheme.onSurfaceVariant,
              ),
            ),
            const SizedBox(height: 16),
            Card(
              child: Column(
                children: [
                  _ContactTile(
                    icon: Icons.phone_outlined,
                    title: l10n.phonePreserveBlessing,
                    subtitle: AppOrg.phonePreserveBlessing,
                    onTap: () =>
                        launchPhone(context, AppOrg.phonePreserveBlessing),
                  ),
                  const Divider(height: 1),
                  _ContactTile(
                    icon: Icons.support_agent_outlined,
                    title: l10n.phoneBeneficiaries,
                    subtitle: AppOrg.phoneBeneficiaries,
                    onTap: () =>
                        launchPhone(context, AppOrg.phoneBeneficiaries),
                  ),
                  const Divider(height: 1),
                  _ContactTile(
                    icon: Icons.handshake_outlined,
                    title: l10n.phoneProjects,
                    subtitle: AppOrg.phoneProjects,
                    onTap: () => launchPhone(context, AppOrg.phoneProjects),
                  ),
                  const Divider(height: 1),
                  _ContactTile(
                    icon: Icons.email_outlined,
                    title: l10n.emailLabel,
                    subtitle: AppOrg.email,
                    onTap: () => launchEmail(context, AppOrg.email),
                  ),
                  const Divider(height: 1),
                  _ContactTile(
                    icon: Icons.location_on_outlined,
                    title: l10n.addressLabel,
                    subtitle: isAr ? AppOrg.addressAr : AppOrg.addressEn,
                  ),
                  const Divider(height: 1),
                  _ContactTile(
                    icon: Icons.schedule_outlined,
                    title: l10n.hoursLabel,
                    subtitle: isAr ? AppOrg.hoursAr : AppOrg.hoursEn,
                  ),
                ],
              ),
            ),
            const SizedBox(height: 24),
            Text(
              l10n.socialMedia,
              style: theme.textTheme.titleMedium?.copyWith(
                fontWeight: FontWeight.w700,
              ),
            ),
            const SizedBox(height: 12),
            Row(
              children: [
                Expanded(
                  child: _SocialCard(
                    icon: Icons.link,
                    label: 'Linktree',
                    onPressed: () => launchAppUri(context, AppOrg.linktree),
                  ),
                ),
                const SizedBox(width: 10),
                Expanded(
                  child: _SocialCard(
                    icon: Icons.alternate_email,
                    label: 'X',
                    onPressed: () => launchAppUri(context, AppOrg.xProfile),
                  ),
                ),
                const SizedBox(width: 10),
                Expanded(
                  child: _SocialCard(
                    icon: Icons.language,
                    label: l10n.website,
                    onPressed: () => launchAppUri(context, AppOrg.website),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

class _ContactTile extends StatelessWidget {
  final IconData icon;
  final String title;
  final String subtitle;
  final VoidCallback? onTap;

  const _ContactTile({
    required this.icon,
    required this.title,
    required this.subtitle,
    this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: Icon(icon, color: AppTheme.primary),
      title: Text(title),
      subtitle: Text(subtitle),
      onTap: onTap,
      trailing: onTap == null ? null : const Icon(Icons.chevron_left),
    );
  }
}

class _SocialCard extends StatelessWidget {
  final IconData icon;
  final String label;
  final VoidCallback onPressed;

  const _SocialCard({
    required this.icon,
    required this.label,
    required this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onPressed,
      borderRadius: BorderRadius.circular(16),
      child: Ink(
        padding: const EdgeInsets.symmetric(vertical: 16),
        decoration: BoxDecoration(
          color: Theme.of(context).colorScheme.primaryContainer,
          borderRadius: BorderRadius.circular(16),
        ),
        child: Column(
          children: [
            Icon(icon, color: AppTheme.primary),
            const SizedBox(height: 6),
            Text(
              label,
              style: Theme.of(context).textTheme.labelLarge?.copyWith(
                    fontWeight: FontWeight.w700,
                  ),
            ),
          ],
        ),
      ),
    );
  }
}
