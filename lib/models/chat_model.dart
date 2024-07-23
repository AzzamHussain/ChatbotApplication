class ChatModel {
  final String chatContent;
  final bool isMyChat;
  final DateTime chatTime;
  final String profilePicture;
  bool isChatAnimated;
// Add this field

  ChatModel({
    required this.chatContent,
    required this.isMyChat,
    required this.chatTime,
    required this.profilePicture,
    required this.isChatAnimated, // Add this parameter
  });
}
