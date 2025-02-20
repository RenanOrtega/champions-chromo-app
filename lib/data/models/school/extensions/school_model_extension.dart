import 'package:champions_chromo_app/data/models/school/school_model.dart';
import 'package:champions_chromo_app/domain/entities/school_entity.dart';

extension SchoolModelExtension on SchoolModel {
  School toDomain() {
    return School(
      id: id,
      name: name,
      email: email,
      phone: phone,
      address: address,
      city: city,
      state: state,
    );
  }
}
