import 'package:flutter/material.dart';
import 'package:planova_app/features/group/presentation/views/group_details/widgets/chat_message_card.dart';

class ChatMessagesList extends StatelessWidget {
  const ChatMessagesList({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView(
      physics: const BouncingScrollPhysics(),
      children: const [
        ChatMessageCard(
          sender: 'Sarah Johnson',
          message: 'Great progress on the literature review!',
          time: '9:22 pm',
        ),
        SizedBox(height: 10),
        ChatMessageCard(
          sender: 'Mike Chen',
          message: 'Can someone review my data collection notes?',
          time: '9:22 pm',
        ),
      ],
    );
  }
}
