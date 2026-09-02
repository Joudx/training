import 'package:flutter/material.dart';
import '../../constants/app_constants.dart';
import '../../l10n/app_localizations.dart';
import '../../theme/app_layout.dart';
import '../../theme/app_theme.dart';

class GalleryScreen extends StatelessWidget {
  const GalleryScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context)!;
    final width = AppLayout.sizeOf(context).width;
    final pad = AppLayout.pagePadding(width);
    final columns = width >= 700 ? 3 : 2;

    return Scaffold(
      appBar: AppBar(title: Text(l10n.gallery)),
      body: ResponsiveBody(
        child: GridView.builder(
          padding: EdgeInsets.all(pad),
          itemCount: AppImages.gallery.length,
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: columns,
            crossAxisSpacing: 12,
            mainAxisSpacing: 12,
            childAspectRatio: 1,
          ),
          itemBuilder: (context, index) {
            final path = AppImages.gallery[index];
            return Hero(
              tag: path,
              child: Material(
                color: Colors.transparent,
                child: InkWell(
                  borderRadius: BorderRadius.circular(AppTheme.radius),
                  onTap: () {
                    Navigator.of(context).push(
                      MaterialPageRoute(
                        builder: (_) => _GalleryPreview(path: path),
                      ),
                    );
                  },
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(AppTheme.radius),
                    child: Image.asset(path, fit: BoxFit.cover),
                  ),
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}

class _GalleryPreview extends StatelessWidget {
  final String path;

  const _GalleryPreview({required this.path});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        backgroundColor: Colors.black,
        foregroundColor: Colors.white,
      ),
      body: Center(
        child: Hero(
          tag: path,
          child: InteractiveViewer(
            child: Image.asset(path, fit: BoxFit.contain),
          ),
        ),
      ),
    );
  }
}
