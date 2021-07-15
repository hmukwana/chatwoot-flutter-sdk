import 'package:json_annotation/json_annotation.dart';

part 'chatwoot_action_data.g.dart';

@JsonSerializable(explicitToJson: true)
class ChatwootActionData {
  @JsonKey(toJson: actionTypeToJson, fromJson: actionTypeFromJson)
  final ChatwootActionType action;

  ChatwootActionData({required this.action});

  factory ChatwootActionData.fromJson(Map<String, dynamic> json) =>
      _$ChatwootActionDataFromJson(json);

  Map<String, dynamic> toJson() => _$ChatwootActionDataToJson(this);
}

enum ChatwootActionType {
  subscribe,
  update_presence,
  conversation_typing_on,
  conversation_typing_off
}

String actionTypeToJson(ChatwootActionType actionType) {
  switch (actionType) {
    case ChatwootActionType.conversation_typing_off:
      return "conversation.typing_off";
    case ChatwootActionType.conversation_typing_on:
      return "conversation.typing_on";
    case ChatwootActionType.update_presence:
      return "update_presence";
    case ChatwootActionType.subscribe:
      return "subscribe";
  }
}

ChatwootActionType actionTypeFromJson(String? value) {
  switch (value) {
    case "conversation.typing_on":
      return ChatwootActionType.conversation_typing_on;
    case "conversation.typing_off":
      return ChatwootActionType.conversation_typing_on;
    case "update_presence":
      return ChatwootActionType.update_presence;
    case "subscribe":
      return ChatwootActionType.subscribe;
    default:
      return ChatwootActionType.update_presence;
  }
}
