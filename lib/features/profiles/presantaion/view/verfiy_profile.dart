// // verify_profile_screen.dart
// import 'package:flutter/material.dart';
// import 'package:flutter_bloc/flutter_bloc.dart';

// class VerifyProfile extends StatelessWidget {
//   const VerifyProfile({super.key});

//   @override
//   Widget build(BuildContext context) {
//     return BlocProvider(
//       create: (context) => VerifyProfileCubit(),
//       child: Scaffold(
//         appBar: AppBar(
//           title: const Text('Profile Verification'),
//           centerTitle: true,
//         ),
//         body: SingleChildScrollView(
//           padding: const EdgeInsets.all(16.0),
//           child: Column(
//             children: [
//               const Text(
//                 'Please upload the following documents for verification',
//                 style: TextStyle(fontSize: 16, fontWeight: FontWeight.w500),
//                 textAlign: TextAlign.center,
//               ),
//               const SizedBox(height: 24),
//               _buildImageUploadSection(
//                 context,
//                 ImageType.idFront,
//                 'ID Front Side',
//                 'Upload the front side of your government-issued ID',
//               ),
//               const SizedBox(height: 20),
//               _buildImageUploadSection(
//                 context,
//                 ImageType.idBack,
//                 'ID Back Side',
//                 'Upload the back side of your government-issued ID',
//               ),
//               const SizedBox(height: 20),
//               _buildImageUploadSection(
//                 context,
//                 ImageType.driverLicense,
//                 'Driver License',
//                 'Upload your valid driver license',
//               ),
//               const SizedBox(height: 20),
//               _buildImageUploadSection(
//                 context,
//                 ImageType.vehicleCertificate,
//                 'Vehicle Certificate',
//                 'Upload your vehicle registration certificate',
//               ),
//               const SizedBox(height: 30),
//               BlocConsumer<VerifyProfileCubit, VerifyProfileState>(
//                 listener: (context, state) {
//                   if (state is VerifyProfileSuccess) {
//                     ScaffoldMessenger.of(context).showSnackBar(
//                       const SnackBar(
//                         content: Text('Verification submitted successfully!'),
//                         backgroundColor: Colors.green,
//                       ),
//                     );
//                   } else if (state is VerifyProfileError) {
//                     ScaffoldMessenger.of(context).showSnackBar(
//                       SnackBar(
//                         content: Text(state.message),
//                         backgroundColor: Colors.red,
//                       ),
//                     );
//                   }
//                 },
//                 builder: (context, state) {
//                   if (state is VerifyProfileLoading) {
//                     return const CircularProgressIndicator();
//                   }
//                   return ElevatedButton(
//                     onPressed: () {
//                       context.read<VerifyProfileCubit>().submitVerification();
//                     },
//                     style: ElevatedButton.styleFrom(
//                       minimumSize: const Size(double.infinity, 50),
//                       shape: RoundedRectangleBorder(
//                         borderRadius: BorderRadius.circular(10),
//                     ),
//                     child: const Text(
//                       'Submit Verification',
//                       style: TextStyle(fontSize: 16),
//                     ),
//                   );
//                 },
//               ),
//             ],
//           ),
//         ),
//       ),
//     );
//   }

//   Widget _buildImageUploadSection(
//     BuildContext context,
//     ImageType type,
//     String title,
//     String description,
//   ) {
//     return BlocBuilder<VerifyProfileCubit, VerifyProfileState>(
//       builder: (context, state) {
//         final imageFile = state.images[type];
//         return Card(
//           elevation: 2,
//           shape: RoundedRectangleBorder(
//             borderRadius: BorderRadius.circular(12),
//           ),
//           child: Padding(
//             padding: const EdgeInsets.all(16.0),
//             child: Column(
//               crossAxisAlignment: CrossAxisAlignment.start,
//               children: [
//                 Text(
//                   title,
//                   style: const TextStyle(
//                     fontSize: 18,
//                     fontWeight: FontWeight.bold,
//                   ),
//                 ),
//                 const SizedBox(height: 4),
//                 Text(
//                   description,
//                   style: TextStyle(
//                     fontSize: 14,
//                     color: Colors.grey[600],
//                   ),
//                 ),
//                 const SizedBox(height: 16),
//                 GestureDetector(
//                   onTap: () => context.read<VerifyProfileCubit>().pickImage(type),
//                   child: Container(
//                     height: 180,
//                     width: double.infinity,
//                     decoration: BoxDecoration(
//                       borderRadius: BorderRadius.circular(10),
//                       color: Colors.grey[100],
//                       border: Border.all(
//                         color: Colors.grey[300]!,
//                         width: 1.5,
//                       ),
//                     ),
//                     child: imageFile == null
//                         ? Column(
//                             mainAxisAlignment: MainAxisAlignment.center,
//                             children: [
//                               Icon(
//                                 Icons.cloud_upload_outlined,
//                                 size: 40,
//                                 color: Colors.grey[400],
//                               ),
//                               const SizedBox(height: 8),
//                               Text(
//                                 'Tap to upload',
//                                 style: TextStyle(
//                                   color: Colors.grey[600],
//                                   fontSize: 16,
//                                 ),
//                               ),
//                             ],
//                           )
//                         : Stack(
//                             children: [
//                               ClipRRect(
//                                 borderRadius: BorderRadius.circular(8),
//                                 child: Image.file(
//                                   imageFile,
//                                   width: double.infinity,
//                                   height: double.infinity,
//                                   fit: BoxFit.cover,
//                                 ),
//                               ),
//                               Positioned(
//                                 top: 8,
//                                 right: 8,
//                                 child: GestureDetector(
//                                   onTap: () => context
//                                       .read<VerifyProfileCubit>()
//                                       .removeImage(type),
//                                   child: Container(
//                                     padding: const EdgeInsets.all(4),
//                                     decoration: const BoxDecoration(
//                                       color: Colors.black54,
//                                       shape: BoxShape.circle,
//                                     ),
//                                     child: const Icon(
//                                       Icons.close,
//                                       color: Colors.white,
//                                       size: 20,
//                                     ),
//                                   ),
//                                 ),
//                               ),
//                             ],
//                           ),
//                   ),
//                 ),
//                 if (imageFile != null) ...[
//                   const SizedBox(height: 8),
//                   Text(
//                     'Uploaded: ${imageFile.path.split('/').last}',
//                     style: TextStyle(
//                       fontSize: 12,
//                       color: Colors.green[700],
//                       fontStyle: FontStyle.italic,
//                     ),
//                     maxLines: 1,
//                     overflow: TextOverflow.ellipsis,
//                   ),
//                 ],
//               ],
//             ),
//           ),
//         );
//       },
//     );
//   }
// }