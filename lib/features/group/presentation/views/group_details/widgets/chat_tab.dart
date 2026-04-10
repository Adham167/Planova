
import 'package:flutter/material.dart';
import 'package:planova_app/core/constants/app_colors.dart';
import 'package:planova_app/features/group/presentation/views/group_details/widgets/chat_messages_list.dart';
import 'package:planova_app/features/group/presentation/views/group_details/widgets/message_input_bar.dart';

class ChatTab extends StatelessWidget {
  const ChatTab({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: const [
        Padding(
          padding: EdgeInsets.only(bottom: 10),
          child: Row(
            children: [
              Text(
                'Team Discussion',
                style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.w700,
                  color: AppColors.kDarkBlue,
                ),
              ),
              Spacer(),
              Icon(Icons.attach_file, size: 14, color: AppColors.kColdGrey),
              SizedBox(width: 4),
              Text(
                'Files',
                style: TextStyle(fontSize: 12, color: AppColors.kColdGrey),
              ),
            ],
          ),
        ),
        Expanded(child: ChatMessagesList()),
        SizedBox(height: 8),
        MessageInputBar(),
      ],
    );
  }
}
