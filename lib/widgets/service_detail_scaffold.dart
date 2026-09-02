import 'package:flutter/material.dart';
import '../theme/app_layout.dart';
import '../theme/app_theme.dart';

class ServiceDetailScaffold extends StatelessWidget {
  final String title;
  final String subtitle;
  final String description;
  final String imagePath;
  final Color accentColor;
  final String ctaLabel;
  final VoidCallback? onDonate;

  const ServiceDetailScaffold({
    super.key,
    required this.title,
    required this.subtitle,
    required this.description,
    required this.imagePath,
    required this.accentColor,
    required this.ctaLabel,
    this.onDonate,
  });

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final width = AppLayout.sizeOf(context).width;
    final pad = AppLayout.pagePadding(width);
    final isWide = width >= AppLayout.compact;

    return Scaffold(
      backgroundColor: AppTheme.surface,
      appBar: AppBar(
        title: Text(title, maxLines: 1, overflow: TextOverflow.ellipsis),
      ),
      body: ResponsiveBody(
        child: ListView(
          padding: EdgeInsets.fromLTRB(pad, 8, pad, 24),
          children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(AppTheme.radius),
              child: AspectRatio(
                aspectRatio: isWide ? 16 / 9 : 4 / 3,
                child: Stack(
                  fit: StackFit.expand,
                  children: [
                    Image.asset(imagePath, fit: BoxFit.cover),
                    DecoratedBox(
                      decoration: BoxDecoration(
                        gradient: LinearGradient(
                          begin: Alignment.topCenter,
                          end: Alignment.bottomCenter,
                          colors: [
                            Colors.transparent,
                            accentColor.withValues(alpha: 0.45),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
            const SizedBox(height: 20),
            Text(
              subtitle,
              style: theme.textTheme.titleLarge?.copyWith(
                fontWeight: FontWeight.w700,
              ),
            ),
            const SizedBox(height: 12),
            Text(
              description,
              style: theme.textTheme.bodyLarge?.copyWith(
                height: 1.7,
                color: theme.colorScheme.onSurfaceVariant,
              ),
            ),
          ],
        ),
      ),
      bottomNavigationBar: SafeArea(
        child: Align(
          alignment: Alignment.bottomCenter,
          child: ConstrainedBox(
            constraints: BoxConstraints(
              maxWidth: AppLayout.contentMaxWidth(width),
            ),
            child: Padding(
              padding: EdgeInsets.fromLTRB(pad, 8, pad, 12),
              child: FilledButton(
                onPressed: onDonate,
                style: FilledButton.styleFrom(
                  backgroundColor: accentColor,
                  foregroundColor: Colors.white,
                  minimumSize: const Size.fromHeight(52),
                ),
                child: Text(ctaLabel),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
