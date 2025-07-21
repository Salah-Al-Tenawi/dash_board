import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:image_picker/image_picker.dart';
import 'package:sharecars/features/vieryfiy_user/data/data_source/verifit_user_remote_data_source.dart';

class VerifyProfileCubit extends Cubit<void> {
  VerifyProfileCubit(this.verifitUserRemoteDataSource) : super(null);

  final ImagePicker _picker = ImagePicker();
  final VerifitUserRemoteDataSource verifitUserRemoteDataSource;

  XFile? frontIdImage;
  XFile? backIdImage;
  XFile? driverLicenseImage;
  XFile? mechanicImage;

  Future<void> pickFrontId() async =>
      await _pickImage((file) => frontIdImage = file);

  Future<void> pickBackId() async =>
      await _pickImage((file) => backIdImage = file);

  Future<void> pickDriverLicense() async =>
      await _pickImage((file) => driverLicenseImage = file);

  Future<void> pickMechanic() async =>
      await _pickImage((file) => mechanicImage = file);

  Future<void> _pickImage(Function(XFile) assign) async {
    final XFile? picked = await _picker.pickImage(source: ImageSource.gallery);
    if (picked != null) {
      assign(picked);
      emit(null); // لإعادة البناء
    }
  }

  bool allImagesSelected(bool isDriver) {
    if (isDriver) {
      return frontIdImage != null &&
          backIdImage != null &&
          driverLicenseImage != null &&
          mechanicImage != null;
    }
    return frontIdImage != null && backIdImage != null;
  }

  Future<void> submitImages() async {
    final response = await verifitUserRemoteDataSource.checkUpDriver(
      frontIdImage,
      backIdImage,
      driverLicenseImage,
      mechanicImage,
    );
  }
}
