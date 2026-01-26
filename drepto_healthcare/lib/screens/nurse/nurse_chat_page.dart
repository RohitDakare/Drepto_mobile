import 'package:flutter/material.dart';
import '../../core/constants/app_colors.dart';
import '../../core/constants/app_text_styles.dart';

class NurseChatPage extends StatelessWidget {
  const NurseChatPage({super.key});

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
                  const Text('Team Chat', style: AppTextStyles.h2),
                  IconButton(
                    icon:
                        const Icon(Icons.add_comment, color: AppColors.primary),
                    onPressed: () {},
                  ),
                ],
              ),
            ),
            Expanded(
              child: ListView.separated(
                itemCount: 6,
                separatorBuilder: (context, index) => const Divider(height: 1),
                itemBuilder: (context, index) {
                  return ListTile(
                    leading: Stack(
                      children: [
                        CircleAvatar(
                          backgroundColor: Colors.blue[100],
                          child: const Icon(Icons.person, color: Colors.blue),
                        ),
                        Positioned(
                          right: 0,
                          bottom: 0,
                          child: Container(
                            width: 12,
                            height: 12,
                            decoration: BoxDecoration(
                              color: AppColors.success,
                              shape: BoxShape.circle,
                              border: Border.all(color: Colors.white, width: 2),
                            ),
                          ),
                        )
                      ],
                    ),
                    title: Text(
                      index == 0 ? 'Dr. Smith (Supervisor)' : 'Nurse Team A',
                      style: AppTextStyles.labelLarge
                          .copyWith(fontWeight: FontWeight.w600),
                    ),
                    subtitle: Text(
                      index == 0
                          ? 'Please update the vitals for...'
                          : 'Shift change at 8 PM',
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                    ),
                    trailing:
                        const Text('10:30 AM', style: AppTextStyles.caption),
                    onTap: () {},
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
