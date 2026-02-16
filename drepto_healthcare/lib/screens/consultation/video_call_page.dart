import 'package:flutter/material.dart';
import 'package:drepto_healthcare/core/constants/app_colors.dart';
import 'package:drepto_healthcare/core/constants/app_spacing.dart';
import 'package:drepto_healthcare/core/constants/app_text_styles.dart';

class VideoCallPage extends StatefulWidget {
  final String doctorName;
  final String specialty;

  const VideoCallPage({
    super.key,
    required this.doctorName,
    required this.specialty,
  });

  @override
  State<VideoCallPage> createState() => _VideoCallPageState();
}

class _VideoCallPageState extends State<VideoCallPage> {
  bool _isMicMuted = false;
  bool _isVideoOff = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: SafeArea(
        child: Stack(
          children: [
            // Main Video Feed (Doctor)
            Container(
              width: double.infinity,
              height: double.infinity,
              color: Colors.grey[900],
              child: const Center(
                child: Icon(Icons.person, size: 120, color: Colors.white24),
              ),
            ),

            // Overlay controls
            Positioned(
              top: 16,
              left: 16,
              right: 16,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Container(
                    padding:
                        const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
                    decoration: BoxDecoration(
                      color: Colors.black.withValues(alpha: 0.5),
                      borderRadius: AppSpacing.borderRadiusFull,
                    ),
                    child: Row(
                      children: [
                        Container(
                          width: 8,
                          height: 8,
                          decoration: const BoxDecoration(
                            color: AppColors.error,
                            shape: BoxShape.circle,
                          ),
                        ),
                        const SizedBox(width: 8),
                        Text(
                          '12:34',
                          style: AppTextStyles.labelSmall
                              .copyWith(color: Colors.white),
                        ),
                      ],
                    ),
                  ),
                  IconButton(
                    icon:
                        const Icon(Icons.flip_camera_ios, color: Colors.white),
                    onPressed: () {},
                  ),
                ],
              ),
            ),

            // Self view
            Positioned(
              right: 16,
              bottom: 120,
              child: Container(
                width: 100,
                height: 150,
                decoration: BoxDecoration(
                  color: Colors.grey[800],
                  borderRadius: AppSpacing.borderRadiusMd,
                  border: Border.all(color: Colors.white.withValues(alpha: 0.5)),
                ),
                child: const Center(
                  child: Icon(Icons.person, color: Colors.white54),
                ),
              ),
            ),

            // Doctor Info overlay
            Positioned(
              left: 16,
              bottom: 120,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    widget.doctorName,
                    style: AppTextStyles.h4.copyWith(
                      color: Colors.white,
                      shadows: [
                        Shadow(
                          blurRadius: 4,
                          color: Colors.black.withValues(alpha: 0.5),
                          offset: const Offset(0, 2),
                        ),
                      ],
                    ),
                  ),
                  Text(
                    widget.specialty,
                    style: AppTextStyles.bodyMedium.copyWith(
                      color: Colors.white.withValues(alpha: 0.9),
                      shadows: [
                        Shadow(
                          blurRadius: 4,
                          color: Colors.black.withValues(alpha: 0.5),
                          offset: const Offset(0, 2),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),

            // Bottom Controls
            Align(
              alignment: Alignment.bottomCenter,
              child: Container(
                padding: const EdgeInsets.all(24),
                decoration: BoxDecoration(
                  gradient: LinearGradient(
                    begin: Alignment.bottomCenter,
                    end: Alignment.topCenter,
                    colors: [
                      Colors.black.withValues(alpha: 0.9),
                      Colors.transparent,
                    ],
                  ),
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    _ControlBtn(
                      icon: _isMicMuted ? Icons.mic_off : Icons.mic,
                      isActive: !_isMicMuted,
                      onTap: () => setState(() => _isMicMuted = !_isMicMuted),
                    ),
                    _ControlBtn(
                      icon: Icons.call_end,
                      color: AppColors.error,
                      size: 64,
                      iconSize: 32,
                      onTap: () => Navigator.pop(context),
                    ),
                    _ControlBtn(
                      icon: _isVideoOff ? Icons.videocam_off : Icons.videocam,
                      isActive: !_isVideoOff,
                      onTap: () => setState(() => _isVideoOff = !_isVideoOff),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class _ControlBtn extends StatelessWidget {
  final IconData icon;
  final VoidCallback onTap;
  final bool isActive;
  final Color? color;
  final double size;
  final double iconSize;

  const _ControlBtn({
    required this.icon,
    required this.onTap,
    this.isActive = true,
    this.color,
    this.size = 50,
    this.iconSize = 24,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        width: size,
        height: size,
        decoration: BoxDecoration(
          color: color ??
              (isActive ? Colors.white : Colors.white.withValues(alpha: 0.2)),
          shape: BoxShape.circle,
        ),
        child: Icon(
          icon,
          color: color != null
              ? Colors.white
              : (isActive ? AppColors.textPrimary : Colors.white),
          size: iconSize,
        ),
      ),
    );
  }
}


