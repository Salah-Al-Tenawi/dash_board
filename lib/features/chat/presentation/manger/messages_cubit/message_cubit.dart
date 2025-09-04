import 'dart:async';
import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

import 'package:image_picker/image_picker.dart';
import 'package:sharecars/features/chat/data/model/message.dart';
import 'package:sharecars/features/chat/domain/repo/chat_repo.dart';

part 'message_state.dart';

class MessageCubit extends Cubit<MessageState> {
  final ChatRepo chatRepoIm;
  StreamSubscription<MessageListResponse>? _messagesStreamSub;
  List<MessageData> _currentMessages = [];

  MessageCubit(this.chatRepoIm) : super(MessageInitial());

  Future<void> getAllMessages(String conversationId) async {
    emit(MessageLoading());
    final response = await chatRepoIm.getAllMessages(conversationId);
    response.fold(
      (error) => emit(MessageError(message: error.message)),
      (messageListResponse) {
        if (!_areListsEqual(_currentMessages, messageListResponse.data)) {
          _currentMessages = List.from(messageListResponse.data);
          emit(MessageLoadSuccess(messages: _currentMessages));
        }
      },
    );
  }

  Future<void> sendTextMessage(
    String type,
    String content,
    String conversationId,
  ) async {
    final response =
        await chatRepoIm.sendTextMessage(type, content, conversationId);
    response.fold(
      (error) => emit(MessageError(message: error.message)),
      (messageModel) {
        _currentMessages.add(messageModel.data);
        emit(MessageLoadSuccess(messages: List.from(_currentMessages)));
        emit(MessageSendSuccess());
      },
    );
  }

  Future<void> sendImageMessage(
    String type,
    String caption,
    String conversationId,
    XFile? image,
  ) async {
    final response = await chatRepoIm.sendImageMessage(
        type, caption, conversationId, image);
    response.fold(
      (error) => emit(MessageError(message: error.message)),
      (messageModel) {
        _currentMessages.add(messageModel.data);
        emit(MessageLoadSuccess(messages: List.from(_currentMessages)));
        emit(MessageSendSuccess());
      },
    );
  }

  void startListeningToMessages(String conversationId) {
    _messagesStreamSub?.cancel();
    _messagesStreamSub = chatRepoIm.watchMessages(conversationId).listen(
      (messageListResponse) {
        if (messageListResponse.data.isNotEmpty &&
            !_areListsEqual(_currentMessages, messageListResponse.data)) {
          _currentMessages = List.from(messageListResponse.data);
          emit(MessageLoadSuccess(messages: _currentMessages));
        }
      },
      onError: (error) {
        emit(MessageError(message: error.toString()));
      },
    );
  }

  void stopListening() {
    _messagesStreamSub?.cancel();
  }

  Future<void> deleteMessage(String messageId) async {
    final response = await chatRepoIm.deleteMessage(messageId);
    response.fold(
      (error) => emit(MessageError(message: error.message)),
      (_) {
        _currentMessages
            .removeWhere((msg) => msg.id == int.parse(messageId));
        emit(MessageLoadSuccess(messages: List.from(_currentMessages)));
      },
    );
  }

  bool _areListsEqual(List<MessageData> oldList, List<MessageData> newList) {
    if (oldList.length != newList.length) return false;
    for (int i = 0; i < oldList.length; i++) {
      if (oldList[i] != newList[i]) return false;
    }
    return true;
  }

  @override
  Future<void> close() {
    _messagesStreamSub?.cancel();
    return super.close();
  }
}
