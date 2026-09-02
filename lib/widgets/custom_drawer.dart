import 'package:flutter/material.dart';
import '../constants/app_constants.dart';
import '../l10n/app_localizations.dart';
import '../theme/app_theme.dart';
import '../utils/app_launchers.dart';

class CustomDrawer extends StatelessWidget {
  final int currentIndex;
  final ValueChanged<int> onIndexChanged;

  const CustomDrawer({
    super.key,
    required this.currentIndex,
    required this.onIndexChanged,
  });

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context)!;
    final headerHeight =
        MediaQuery.sizeOf(context).height < 640 ? 168.0 : 208.0;

    return Drawer(
      width: MediaQuery.sizeOf(context).width < 360 ? 280 : 304,
      child: ListView(
        padding: EdgeInsets.zero,
        children: [
          Container(
            height: headerHeight,
            decoration: const BoxDecoration(
              gradient: LinearGradient(
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
                colors: [AppTheme.primary, AppTheme.primaryDark],
              ),
              borderRadius: BorderRadius.only(
                bottomRight: Radius.circular(AppTheme.radius),
              ),
            ),
            child: Padding(
              padding: const EdgeInsets.all(20),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const CircleAvatar(
                    backgroundColor: Colors.white,
                    radius: 30,
                    child: Icon(
                      Icons.volunteer_activism,
                      color: AppTheme.primary,
                      size: 34,
                    ),
                  ),
                  const SizedBox(height: 14),
                  Text(
                    l10n.appmaindescription,
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis,
                    style: const TextStyle(
                      color: Colors.white,
                      fontSize: 18,
                      fontWeight: FontWeight.w800,
                    ),
                  ),
                  const SizedBox(height: 4),
                  Text(
                    l10n.weworkforgoodness,
                    style: const TextStyle(color: Colors.white70, fontSize: 13),
                  ),
                ],
              ),
            ),
          ),
          _DrawerTile(
            icon: Icons.home_outlined,
            label: l10n.home,
            selected: currentIndex == 0,
            onTap: () {
              Navigator.pop(context);
              onIndexChanged(0);
            },
          ),
          _DrawerTile(
            icon: Icons.photo_library_outlined,
            label: l10n.gallery,
            onTap: () {
              Navigator.pop(context);
              Navigator.pushNamed(context, AppRoutes.gallery);
            },
          ),
          _DrawerTile(
            icon: Icons.volunteer_activism_outlined,
            label: l10n.dontations,
            selected: currentIndex == 1,
            onTap: () {
              Navigator.pop(context);
              onIndexChanged(1);
            },
          ),
          _DrawerTile(
            icon: Icons.assignment_outlined,
            label: l10n.programs,
            selected: currentIndex == 2,
            onTap: () {
              Navigator.pop(context);
              onIndexChanged(2);
            },
          ),
          _DrawerTile(
            icon: Icons.campaign_outlined,
            label: l10n.currentampaigns,
            onTap: () {
              Navigator.pop(context);
              Navigator.pushNamed(context, AppRoutes.campaigns);
            },
          ),
          _DrawerTile(
            icon: Icons.history,
            label: l10n.mydonationrecord,
            onTap: () {
              Navigator.pop(context);
              Navigator.pushNamed(context, AppRoutes.donationHistory);
            },
          ),
          const Divider(),
          _DrawerTile(
            icon: Icons.info_outline,
            label: l10n.aboutcharity,
            selected: currentIndex == 3,
            onTap: () {
              Navigator.pop(context);
              onIndexChanged(3);
            },
          ),
          _DrawerTile(
            icon: Icons.contact_phone_outlined,
            label: l10n.callus,
            onTap: () {
              Navigator.pop(context);
              Navigator.pushNamed(context, AppRoutes.contact);
            },
          ),
          _DrawerTile(
            icon: Icons.share_outlined,
            label: l10n.shareapp,
            onTap: () {
              Navigator.pop(context);
              Navigator.pushNamed(context, AppRoutes.share);
            },
          ),
          _DrawerTile(
            icon: Icons.language,
            label: l10n.website,
            onTap: () {
              Navigator.pop(context);
              launchAppUri(context, AppOrg.website);
            },
          ),
        ],
      ),
    );
  }
}

class _DrawerTile extends StatelessWidget {
  final IconData icon;
  final String label;
  final bool selected;
  final VoidCallback onTap;

  const _DrawerTile({
    required this.icon,
    required this.label,
    required this.onTap,
    this.selected = false,
  });

  @override
  Widget build(BuildContext context) {
    final primary = Theme.of(context).colorScheme.primary;
    return ListTile(
      leading: Icon(icon, color: primary),
      title: Text(label),
      selected: selected,
      selectedTileColor: primary.withValues(alpha: 0.08),
      onTap: onTap,
    );
  }
}
