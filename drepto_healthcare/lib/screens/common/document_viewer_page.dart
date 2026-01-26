import 'package:flutter/material.dart';
import '../../core/constants/app_colors.dart';

class DocumentViewerPage extends StatelessWidget {
  final String title;
  final String url;
  final String type; // 'image', 'pdf'

  const DocumentViewerPage({
    super.key,
    required this.title,
    required this.url,
    this.type = 'image',
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        title: Text(title),
        backgroundColor: Colors.black,
        foregroundColor: Colors.white,
      ),
      body: Center(
        child: type == 'image'
            ? Image.network(
                url,
                loadingBuilder: (_, child, progress) {
                  if (progress == null) return child;
                  return const CircularProgressIndicator(
                      color: AppColors.primary);
                },
                errorBuilder: (_, __, ___) => const Icon(Icons.broken_image,
                    color: Colors.white, size: 50),
              )
            : const Text('PDF Viewer Placeholder',
                style: TextStyle(color: Colors.white)),
      ),
    );
  }
}
