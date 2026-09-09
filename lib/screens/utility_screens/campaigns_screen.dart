import 'package:flutter/material.dart';
import '../../constants/app_constants.dart';
import '../../l10n/app_localizations.dart';
import '../../theme/app_layout.dart';
import '../../theme/app_theme.dart';
import '../../utils/auth_guards.dart';

class CampaignsScreen extends StatelessWidget {
  const CampaignsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context)!;
    final pad = AppLayout.pagePadding(AppLayout.sizeOf(context).width);

    final campaigns = [
      (
        title: l10n.iftarforafastingperson,
        desc: l10n.providingiftarmeals,
        image: AppImages.breakfast,
        color: AppTheme.iftar,
        progress: 0.75,
      ),
      (
        title: l10n.waterdistribution,
        desc: l10n.distributebottlesofwater,
        image: AppImages.water,
        color: AppTheme.water,
        progress: 0.60,
      ),
      (
        title: l10n.foodbaskets,
        desc: l10n.distributionbasketsnecessities,
        image: AppImages.foodBaskets,
        color: AppTheme.baskets,
        progress: 0.45,
      ),
      (
        title: l10n.surplusfood,
        desc: l10n.distributingfooddescroption,
        image: AppImages.foodSurplus,
        color: AppTheme.surplus,
        progress: 0.55,
      ),
    ];

    return Scaffold(
      appBar: AppBar(title: Text(l10n.currentampaigns)),
      body: ResponsiveBody(
        child: ListView.separated(
          padding: EdgeInsets.all(pad),
          itemCount: campaigns.length,
          separatorBuilder: (_, __) => const SizedBox(height: 12),
          itemBuilder: (context, index) {
            final c = campaigns[index];
            return Card(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  ClipRRect(
                    borderRadius: const BorderRadius.vertical(
                      top: Radius.circular(AppTheme.radius),
                    ),
                    child: AspectRatio(
                      aspectRatio: 16 / 9,
                      child: Image.asset(c.image, fit: BoxFit.cover),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(16),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          c.title,
                          style: Theme.of(context).textTheme.titleMedium
                              ?.copyWith(fontWeight: FontWeight.w800),
                        ),
                        const SizedBox(height: 6),
                        Text(
                          c.desc,
                          style: Theme.of(context).textTheme.bodyMedium
                              ?.copyWith(
                                color: Theme.of(context)
                                    .colorScheme
                                    .onSurfaceVariant,
                              ),
                        ),
                        const SizedBox(height: 12),
                        LinearProgressIndicator(
                          value: c.progress,
                          color: c.color,
                          backgroundColor: c.color.withValues(alpha: 0.15),
                          borderRadius: BorderRadius.circular(8),
                          minHeight: 8,
                        ),
                        const SizedBox(height: 8),
                        Row(
                          children: [
                            Text('${(c.progress * 100).round()}%'),
                            const Spacer(),
                            FilledButton(
                              onPressed: () => goToDonate(context),
                              style: FilledButton.styleFrom(
                                backgroundColor: c.color,
                              ),
                              child: Text(l10n.donatenow),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            );
          },
        ),
      ),
    );
  }
}
