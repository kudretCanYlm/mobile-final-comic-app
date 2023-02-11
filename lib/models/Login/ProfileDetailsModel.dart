import 'package:comic_mobile_app/widgets/common/ImagesCommon.dart';

class ProfileDetailsModel {
  String RealName;
  String Phone;
  String NickName;
  String base64Image;

  ProfileDetailsModel(
      this.RealName, this.Phone, this.NickName, this.base64Image);

  setImage(String base64) {
    if (base64.length < 50) {
      base64Image = PROFILE_IMAGE;
    }
  }
}
