// // verify_profile_cubit.dart
// import 'dart:io';
// import 'package:flutter_bloc/flutter_bloc.dart';
// import 'package:image_picker/image_picker.dart';

// class VerifyProfileCubit extends Cubit<VerifyProfileState> {
//   VerifyProfileCubit() : super(VerifyProfileInitial());

//   final ImagePicker _picker = ImagePicker();

//   Future<void> pickImage(ImageType type) async {
//     try {
//       final XFile? image = await _picker.pickImage(source: ImageSource.gallery);
//       if (image != null) {
//         final updatedImages = Map<ImageType, File?>.from(state.images);
//         updatedImages[type] = File(image.path);
//         emit(VerifyProfileUpdated(images: updatedImages));
//       }
//     } catch (e) {
//       emit(VerifyProfileError(message: 'Failed to pick image: $e'));
//     }
//   }

//   void removeImage(ImageType type) {
//     final updatedImages = Map<ImageType, File?>.from(state.images);
//     updatedImages[type] = null;
//     emit(VerifyProfileUpdated(images: updatedImages));
//   }

//   Future<void> submitVerification() async {
//     if (state.images.values.any((image) => image == null)) {
//       emit(VerifyProfileError(message: 'Please upload all required images'));
//       return;
//     }
    
//     emit(VerifyProfileLoading());
//     try {
//       // Here you would upload the images to your backend
//       await Future.delayed(const Duration(seconds: 2)); // Simulate network request
//       emit(VerifyProfileSuccess());
//     } catch (e) {
//       emit(VerifyProfileError(message: 'Verification failed: $e'));
//     }
//   }
// }
