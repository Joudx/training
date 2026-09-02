import 'package:flutter/material.dart';
import '../l10n/app_localizations.dart';
import '../models/charity_service.dart';

class ServiceCard extends StatelessWidget {
  final CharityService service;

  const ServiceCard({super.key, required this.service});

  void _showComingSoonDialog(BuildContext context) {
    final l10n = AppLocalizations.of(context)!;
    final theme = Theme.of(context);

    showDialog<void>(
      context: context,
      builder: (dialogContext) {
        return AlertDialog(
          icon: Icon(
            Icons.construction_outlined,
            color: theme.colorScheme.primary,
            size: 36,
          ),
          title: Text(l10n.featureInProgressTitle),
          content: Text(l10n.featureInProgressBody),
          actions: [
            FilledButton(
              onPressed: () => Navigator.pop(dialogContext),
              child: Text(l10n.ok),
            ),
          ],
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context)!;
    final isNarrow = MediaQuery.sizeOf(context).width < 360;

    return Card(
      child: InkWell(
        onTap: () => Navigator.pushNamed(context, service.route),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Expanded(
              child: Stack(
                fit: StackFit.expand,
                children: [
                  Image.asset(service.image, fit: BoxFit.cover),
                  DecoratedBox(
                    decoration: BoxDecoration(
                      gradient: LinearGradient(
                        begin: Alignment.topCenter,
                        end: Alignment.bottomCenter,
                        colors: [
                          service.color.withValues(alpha: 0.05),
                          Colors.black.withValues(alpha: 0.55),
                        ],
                      ),
                    ),
                  ),
                  Positioned.directional(
                    textDirection: Directionality.of(context),
                    top: 10,
                    start: 10,
                    child: CircleAvatar(
                      radius: isNarrow ? 14 : 16,
                      backgroundColor: Colors.white.withValues(alpha: 0.9),
                      child: Icon(
                        service.icon,
                        size: isNarrow ? 14 : 16,
                        color: service.color,
                      ),
                    ),
                  ),
                ],
              ),
            ),
            Padding(
              padding: EdgeInsets.fromLTRB(
                isNarrow ? 8 : 12,
                isNarrow ? 8 : 10,
                isNarrow ? 8 : 12,
                isNarrow ? 8 : 12,
              ),
              child: Column(
                children: [
                  Text(
                    service.title,
                    textAlign: TextAlign.center,
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis,
                    style: Theme.of(context).textTheme.titleSmall?.copyWith(
                      fontWeight: FontWeight.w700,
                      fontSize: isNarrow ? 12 : null,
                    ),
                  ),
                  SizedBox(height: isNarrow ? 6 : 8),
                  SizedBox(
                    width: double.infinity,
                    child: FilledButton(
                      onPressed: () => _showComingSoonDialog(context),
                      style: FilledButton.styleFrom(
                        backgroundColor: service.color,
                        foregroundColor: Colors.white,
                        visualDensity: isNarrow
                            ? VisualDensity.compact
                            : VisualDensity.standard,
                        padding: EdgeInsets.symmetric(
                          vertical: isNarrow ? 6 : 8,
                        ),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(12),
                        ),
                        textStyle: TextStyle(
                          fontSize: isNarrow ? 11 : 12,
                          fontWeight: FontWeight.w700,
                        ),
                      ),
                      child: Text(l10n.donate),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
