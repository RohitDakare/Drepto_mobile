import 'package:flutter/material.dart';
import '../../core/constants/app_colors.dart';
import '../../core/constants/app_text_styles.dart';

class DoctorMessagesPage extends StatelessWidget {
  const DoctorMessagesPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.backgroundLight,
      body: SafeArea(
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(16),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Text('Messages', style: AppTextStyles.h2),
                  IconButton(
                    icon:
                        const Icon(Icons.edit_square, color: AppColors.primary),
                    onPressed: () {},
                  ),
                ],
              ),
            ),
            Expanded(
              child: ListView.separated(
                itemCount: 8,
                separatorBuilder: (context, index) => const Divider(height: 1),
                itemBuilder: (context, index) {
                  return _MessageItem(
                    senderName: 'Patient Name ${index + 1}',
                    messageSnippet: index % 2 == 0
                        ? 'Hello Doctor, I have a query regarding my...'
                        : 'Thanks for the prescription!',
                    time: '${10 + index}:30 AM',
                    unreadCount: index % 3 == 0 ? 2 : 0,
                    isOnline: index % 4 == 0,
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class _MessageItem extends StatelessWidget {
  final String senderName;
  final String messageSnippet;
  final String time;
  final int unreadCount;
  final bool isOnline;

  const _MessageItem({
    required this.senderName,
    required this.messageSnippet,
    required this.time,
    required this.unreadCount,
    required this.isOnline,
  });

  @override
  Widget build(BuildContext context) {
    return ListTile(
      contentPadding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
      leading: Stack(
        children: [
          const CircleAvatar(
            radius: 24,
            backgroundColor: AppColors.gray200,
            backgroundImage: NetworkImage(
                'https://randomuser.me/api/portraits/thumb/men/42.jpg'),
          ),
          if (isOnline)
            Positioned(
              right: 0,
              bottom: 0,
              child: Container(
                width: 14,
                height: 14,
                decoration: BoxDecoration(
                  color: AppColors.success,
                  shape: BoxShape.circle,
                  border: Border.all(color: Colors.white, width: 2),
                ),
              ),
            ),
        ],
      ),
      title: Text(
        senderName,
        style: AppTextStyles.labelLarge.copyWith(fontWeight: FontWeight.w600),
      ),
      subtitle: Text(
        messageSnippet,
        style: AppTextStyles.bodyMedium.copyWith(
          color:
              unreadCount > 0 ? AppColors.textPrimary : AppColors.textSecondary,
          fontWeight: unreadCount > 0 ? FontWeight.w500 : FontWeight.normal,
        ),
        maxLines: 1,
        overflow: TextOverflow.ellipsis,
      ),
      trailing: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.end,
        children: [
          Text(
            time,
            style: AppTextStyles.caption.copyWith(
              color:
                  unreadCount > 0 ? AppColors.primary : AppColors.textSecondary,
              fontWeight: unreadCount > 0 ? FontWeight.w600 : FontWeight.normal,
            ),
          ),
          if (unreadCount > 0) ...[
            const SizedBox(height: 6),
            Container(
              padding: const EdgeInsets.all(6),
              decoration: const BoxDecoration(
                color: AppColors.primary,
                shape: BoxShape.circle,
              ),
              child: Text(
                '$unreadCount',
                style: AppTextStyles.labelSmall.copyWith(
                  color: Colors.white,
                  fontSize: 10,
                ),
              ),
            ),
          ],
        ],
      ),
      onTap: () {},
    );
  }
}
