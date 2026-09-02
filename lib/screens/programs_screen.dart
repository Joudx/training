import 'package:flutter/material.dart';
import '../constants/app_constants.dart';
import '../l10n/app_localizations.dart';
import '../theme/app_layout.dart';
import '../theme/app_theme.dart';

class ProgramsScreen extends StatelessWidget {
  const ProgramsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final l10n = AppLocalizations.of(context)!;
    final pad = AppLayout.pagePadding(AppLayout.sizeOf(context).width);

    final programs = [
      (
        title: l10n.surplusfood,
        desc: l10n.surplusfooddescription,
        icon: Icons.restaurant,
        color: AppTheme.surplus,
        image: AppImages.foodSurplus,
        route: AppRoutes.foodSurplus,
      ),
      (
        title: l10n.iftarforafastingperson,
        desc: l10n.providinggrandmosque,
        icon: Icons.mosque,
        color: AppTheme.iftar,
        image: AppImages.breakfast,
        route: AppRoutes.breakfast,
      ),
      (
        title: l10n.freshmeat,
        desc: l10n.freshmeatdescription,
        icon: Icons.set_meal,
        color: AppTheme.meat,
        image: AppImages.meat,
        route: AppRoutes.meatDistribution,
      ),
      (
        title: l10n.hotmeals,
        desc: l10n.providinghotmealsneeddescription,
        icon: Icons.rice_bowl,
        color: AppTheme.hotMeals,
        image: AppImages.hotMeals,
        route: AppRoutes.hotMeals,
      ),
      (
        title: l10n.waterdistribution,
        desc: l10n.waterdistribituindescription,
        icon: Icons.local_drink,
        color: AppTheme.water,
        image: AppImages.water,
        route: AppRoutes.waterDistribution,
      ),
      (
        title: l10n.foodbaskets,
        desc: l10n.distributionbasketsnecessities,
        icon: Icons.shopping_basket,
        color: AppTheme.baskets,
        image: AppImages.foodBaskets,
        route: AppRoutes.foodBaskets,
      ),
    ];

    return ResponsiveBody(
      child: ListView.separated(
        padding: EdgeInsets.fromLTRB(pad, 8, pad, 24),
        itemCount: programs.length + 1,
        separatorBuilder: (_, __) => const SizedBox(height: 12),
        itemBuilder: (context, index) {
          if (index == 0) {
            return Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  l10n.programs,
                  style: theme.textTheme.headlineSmall?.copyWith(
                    fontWeight: FontWeight.w800,
                  ),
                ),
                const SizedBox(height: 6),
                Text(
                  l10n.programsIntro,
                  style: theme.textTheme.bodyMedium?.copyWith(
                    color: theme.colorScheme.onSurfaceVariant,
                    height: 1.6,
                  ),
                ),
              ],
            );
          }

          final p = programs[index - 1];
          return Card(
            child: InkWell(
              onTap: () => Navigator.pushNamed(context, p.route),
              child: Padding(
                padding: const EdgeInsets.all(12),
                child: Row(
                  children: [
                    ClipRRect(
                      borderRadius: BorderRadius.circular(14),
                      child: Image.asset(
                        p.image,
                        width: 84,
                        height: 84,
                        fit: BoxFit.cover,
                      ),
                    ),
                    const SizedBox(width: 12),
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Row(
                            children: [
                              Icon(p.icon, size: 18, color: p.color),
                              const SizedBox(width: 6),
                              Expanded(
                                child: Text(
                                  p.title,
                                  maxLines: 1,
                                  overflow: TextOverflow.ellipsis,
                                  style: theme.textTheme.titleMedium?.copyWith(
                                    fontWeight: FontWeight.w800,
                                  ),
                                ),
                              ),
                            ],
                          ),
                          const SizedBox(height: 6),
                          Text(
                            p.desc,
                            maxLines: 2,
                            overflow: TextOverflow.ellipsis,
                            style: theme.textTheme.bodySmall?.copyWith(
                              color: theme.colorScheme.onSurfaceVariant,
                              height: 1.4,
                            ),
                          ),
                        ],
                      ),
                    ),
                    Icon(
                      Icons.chevron_left,
                      color: theme.colorScheme.onSurfaceVariant,
                    ),
                  ],
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
