// import 'dart:io';

// import 'package:equatable/equatable.dart';

// sealed class VerifyprofileState extends Equatable {
//   final File? idFrontImage;
//   final File? idBackImage;
//   final File? driverLicenseImage;
//   final File? vehicleCertificateImage;
  
//   const VerifyprofileState({
//     this.idFrontImage,
//     this.idBackImage,
//     this.driverLicenseImage,
//     this.vehicleCertificateImage,
    
//   });

//   bool get allImagesUploaded =>
//       idFrontImage != null &&
//       idBackImage != null &&
//       driverLicenseImage != null &&
//       vehicleCertificateImage != null;

//   @override
//   List<Object?> get props => [
//         idFrontImage,
//         idBackImage,
//         driverLicenseImage,
//         vehicleCertificateImage,
        
//       ];
// }

// final class VerifyprofileInitial extends VerifyprofileState {
//   const VerifyprofileInitial() : super();
// }

// final class VerifyprofileLoading extends VerifyprofileState {
// }

// final class VerifyprofileImageUpdated extends VerifyprofileState {
//   const VerifyprofileImageUpdated({
//     required super.idFrontImage,
//     required super.idBackImage,
//     required super.driverLicenseImage,
//     required super.vehicleCertificateImage,
//   });
// }

// final class VerifyprofileSubmissionSuccess extends VerifyprofileState {
//   const VerifyprofileSubmissionSuccess({
//     required super.idFrontImage,
//     required super.idBackImage,
//     required super.driverLicenseImage,
//     required super.vehicleCertificateImage,
//     required super.successMessage,
//   });
// }

// final class VerifyprofileSubmissionFailure extends VerifyprofileState {
//   const VerifyprofileSubmissionFailure({
//     super.idFrontImage,
//     super.idBackImage,
//     super.driverLicenseImage,
//     super.vehicleCertificateImage,
//     required super.errorMessage,
//   });
// }

// final class VerifyprofileImagePickingFailure extends VerifyprofileState {
//   const VerifyprofileImagePickingFailure({
//     super.idFrontImage,
//     super.idBackImage,
//     super.driverLicenseImage,
//     super.vehicleCertificateImage,
//     required super.errorMessage,
//   });
// }

// final class VerifyprofileIncompleteSubmission extends VerifyprofileState {
//   const VerifyprofileIncompleteSubmission({
//     super.idFrontImage,
//     super.idBackImage,
//     super.driverLicenseImage,
//     super.vehicleCertificateImage,
//     required super.errorMessage,
//   });
// }