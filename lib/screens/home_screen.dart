import 'package:flutter/material.dart';
import '../constants/app_constants.dart';
import '../l10n/app_localizations.dart';
import '../models/charity_service.dart';
import '../navigation/app_tabs.dart';
import '../theme/app_layout.dart';
import '../theme/app_theme.dart';
import '../utils/auth_guards.dart';
import '../widgets/service_card.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  List<CharityService> _services(AppLocalizations l10n) => [
        CharityService(
          title: l10n.surplusfood,
          description: l10n.distributingfooddescroption,
          icon: Icons.restaurant,
          color: AppTheme.surplus,
          image: AppImages.foodSurplus,
          route: AppRoutes.foodSurplus,
        ),
        CharityService(
          title: l10n.iftarforafastingperson,
          description: l10n.providinggrandmosque,
          icon: Icons.mosque,
          color: AppTheme.iftar,
          image: AppImages.breakfast,
          route: AppRoutes.breakfast,
        ),
        CharityService(
          title: l10n.freshmeat,
          description: l10n.distributingmeatneedyfamilies,
          icon: Icons.set_meal,
          color: AppTheme.meat,
          image: AppImages.meat,
          route: AppRoutes.meatDistribution,
        ),
        CharityService(
          title: l10n.hotmeals,
          description: l10n.providinghotmealsneed,
          icon: Icons.rice_bowl,
          color: AppTheme.hotMeals,
          image: AppImages.hotMeals,
          route: AppRoutes.hotMeals,
        ),
        CharityService(
          title: l10n.waterdistribution,
          description: l10n.providingdrinkingwaterneed,
          icon: Icons.local_drink,
          color: AppTheme.water,
          image: AppImages.water,
          route: AppRoutes.waterDistribution,
        ),
        CharityService(
          title: l10n.foodbaskets,
          description: l10n.distributionbasketsnecessities,
          icon: Icons.shopping_basket,
          color: AppTheme.baskets,
          image: AppImages.foodBaskets,
          route: AppRoutes.foodBaskets,
        ),
      ];

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context)!;
    final theme = Theme.of(context);
    final size = AppLayout.sizeOf(context);
    final width = size.width;
    final pad = AppLayout.pagePadding(width);
    final isNarrow = width < 360;
    final statColumns = AppLayout.statColumns(width);
    final serviceColumns = AppLayout.serviceColumns(width);
    final services = _services(l10n);

    final stats = [
      {'value': AppOrg.beneficiariesStat, 'label': l10n.beneficiary},
      {'value': AppOrg.fieldTripsStat, 'label': l10n.fieldTrips},
      {'value': AppOrg.volunteersStat, 'label': l10n.volunteer},
      {'value': AppOrg.fleetStat, 'label': l10n.fleetVehicles},
    ];

    return ResponsiveBody(
      child: LayoutBuilder(
        builder: (context, constraints) {
          final innerWidth = constraints.maxWidth;
          final gridWidth = innerWidth - (pad * 2);
          final aspect =
              AppLayout.serviceAspectRatio(gridWidth, serviceColumns);

          return SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: EdgeInsets.fromLTRB(pad, 8, pad, 0),
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(AppTheme.radius),
                    child: SizedBox(
                      height: AppLayout.heroHeight(size),
                      width: double.infinity,
                      child: Stack(
                        fit: StackFit.expand,
                        children: [
                          Image.asset(AppImages.hero, fit: BoxFit.cover),
                          const DecoratedBox(
                            decoration: BoxDecoration(
                              gradient: LinearGradient(
                                begin: Alignment.topCenter,
                                end: Alignment.bottomCenter,
                                colors: [
                                  Color(0x330D6B63),
                                  Color(0xE60A524C),
                                ],
                              ),
                            ),
                          ),
                          Padding(
                            padding: EdgeInsets.all(isNarrow ? 14 : 20),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.end,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  l10n.appmaindescription,
                                  maxLines: 2,
                                  overflow: TextOverflow.ellipsis,
                                  style: (isNarrow
                                          ? theme.textTheme.titleLarge
                                          : theme.textTheme.headlineSmall)
                                      ?.copyWith(
                                        color: Colors.white,
                                        fontWeight: FontWeight.w800,
                                      ),
                                ),
                                SizedBox(height: isNarrow ? 6 : 8),
                                Text(
                                  l10n.appsubdescription,
                                  maxLines: 2,
                                  overflow: TextOverflow.ellipsis,
                                  style: theme.textTheme.bodyMedium?.copyWith(
                                    color: Colors.white.withValues(alpha: 0.92),
                                    fontSize: isNarrow ? 13 : null,
                                  ),
                                ),
                                SizedBox(height: isNarrow ? 10 : 16),
                                FilledButton(
                                  onPressed: () => goToDonate(context),
                                  style: FilledButton.styleFrom(
                                    backgroundColor: AppTheme.secondary,
                                    foregroundColor: Colors.white,
                                    visualDensity: isNarrow
                                        ? VisualDensity.compact
                                        : VisualDensity.standard,
                                  ),
                                  child: Text(l10n.donatenow),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.fromLTRB(pad, 16, pad, 4),
                  child: GridView.builder(
                    shrinkWrap: true,
                    physics: const NeverScrollableScrollPhysics(),
                    itemCount: stats.length,
                    gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: statColumns,
                      crossAxisSpacing: 8,
                      mainAxisSpacing: 8,
                      childAspectRatio: statColumns == 2 ? 2.2 : 1.1,
                    ),
                    itemBuilder: (context, index) {
                      final stat = stats[index];
                      return Card(
                        child: Padding(
                          padding: const EdgeInsets.symmetric(
                            vertical: 10,
                            horizontal: 6,
                          ),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              FittedBox(
                                child: Text(
                                  stat['value'] as String,
                                  style: theme.textTheme.titleMedium?.copyWith(
                                    fontWeight: FontWeight.w800,
                                    color: theme.colorScheme.primary,
                                  ),
                                ),
                              ),
                              const SizedBox(height: 4),
                              Text(
                                stat['label'] as String,
                                textAlign: TextAlign.center,
                                maxLines: 1,
                                overflow: TextOverflow.ellipsis,
                                style: theme.textTheme.labelSmall?.copyWith(
                                  color: theme.colorScheme.onSurfaceVariant,
                                ),
                              ),
                            ],
                          ),
                        ),
                      );
                    },
                  ),
                ),
                Padding(
                  padding: EdgeInsets.fromLTRB(pad, 16, pad - 8, 4),
                  child: Row(
                    children: [
                      Expanded(
                        child: Text(
                          l10n.ourservices,
                          style: theme.textTheme.titleLarge?.copyWith(
                            fontWeight: FontWeight.w800,
                            fontSize: isNarrow ? 18 : null,
                          ),
                        ),
                      ),
                      TextButton(
                        onPressed: () => appTabIndex.value = 2,
                        child: Text(l10n.showall),
                      ),
                    ],
                  ),
                ),
                GridView.builder(
                  shrinkWrap: true,
                  physics: const NeverScrollableScrollPhysics(),
                  itemCount: services.length,
                  padding: EdgeInsets.fromLTRB(pad, 8, pad, 8),
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: serviceColumns,
                    crossAxisSpacing: 12,
                    mainAxisSpacing: 12,
                    childAspectRatio: aspect,
                  ),
                  itemBuilder: (context, index) {
                    return ServiceCard(service: services[index]);
                  },
                ),
                Padding(
                  padding: EdgeInsets.fromLTRB(pad, 12, pad, 10),
                  child: Row(
                    children: [
                      Expanded(
                        child: Text(
                          l10n.currentampaigns,
                          style: theme.textTheme.titleLarge?.copyWith(
                            fontWeight: FontWeight.w800,
                            fontSize: isNarrow ? 18 : null,
                          ),
                        ),
                      ),
                      TextButton(
                        onPressed: () => Navigator.pushNamed(
                          context,
                          AppRoutes.campaigns,
                        ),
                        child: Text(l10n.showall),
                      ),
                    ],
                  ),
                ),
                SizedBox(
                  height: AppLayout.campaignHeight(width),
                  child: ListView(
                    scrollDirection: Axis.horizontal,
                    padding: EdgeInsets.symmetric(horizontal: pad),
                    children: [
                      _CampaignCard(
                        title: l10n.iftarforafastingperson,
                        description: l10n.providingiftarmeals,
                        progress: 75,
                        color: AppTheme.iftar,
                        image: AppImages.breakfast,
                        width: AppLayout.campaignWidth(width),
                        onDonate: () => goToDonate(context),
                      ),
                      _CampaignCard(
                        title: l10n.waterdistribution,
                        description: l10n.distributebottlesofwater,
                        progress: 60,
                        color: AppTheme.water,
                        image: AppImages.water,
                        width: AppLayout.campaignWidth(width),
                        onDonate: () => goToDonate(context),
                      ),
                      _CampaignCard(
                        title: l10n.foodbaskets,
                        description: l10n.distributionbasketsnecessities,
                        progress: 45,
                        color: AppTheme.baskets,
                        image: AppImages.foodBaskets,
                        width: AppLayout.campaignWidth(width),
                        onDonate: () => goToDonate(context),
                      ),
                    ],
                  ),
                ),
                const SizedBox(height: 24),
              ],
            ),
          );
        },
      ),
    );
  }
}

class _CampaignCard extends StatelessWidget {
  final String title;
  final String description;
  final int progress;
  final Color color;
  final String image;
  final double width;
  final VoidCallback onDonate;

  const _CampaignCard({
    required this.title,
    required this.description,
    required this.progress,
    required this.color,
    required this.image,
    required this.width,
    required this.onDonate,
  });

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context)!;

    return Container(
      width: width,
      margin: const EdgeInsetsDirectional.only(end: 12),
      child: Card(
        child: InkWell(
          onTap: onDonate,
          child: Stack(
            fit: StackFit.expand,
            children: [
              Image.asset(image, fit: BoxFit.cover),
              DecoratedBox(
                decoration: BoxDecoration(
                  gradient: LinearGradient(
                    begin: Alignment.topCenter,
                    end: Alignment.bottomCenter,
                    colors: [
                      Colors.black.withValues(alpha: 0.12),
                      Colors.black.withValues(alpha: 0.78),
                    ],
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(14),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      title,
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                      style: const TextStyle(
                        color: Colors.white,
                        fontSize: 16,
                        fontWeight: FontWeight.w800,
                      ),
                    ),
                    const SizedBox(height: 4),
                    Text(
                      description,
                      maxLines: 2,
                      overflow: TextOverflow.ellipsis,
                      style: TextStyle(
                        color: Colors.white.withValues(alpha: 0.85),
                        fontSize: 12,
                      ),
                    ),
                    const Spacer(),
                    LinearProgressIndicator(
                      value: progress / 100,
                      backgroundColor: Colors.white.withValues(alpha: 0.25),
                      color: color,
                      borderRadius: BorderRadius.circular(10),
                      minHeight: 6,
                    ),
                    const SizedBox(height: 6),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          '$progress%',
                          style: const TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.w700,
                            fontSize: 12,
                          ),
                        ),
                        Text(
                          l10n.donatenow,
                          style: const TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.w800,
                            fontSize: 12,
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
