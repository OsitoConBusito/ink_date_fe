import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:ink_date/gen/strings.g.dart';
import 'package:ink_date/shared/widgets/person_icon.dart';

import '../../theme/theme.dart';

class ProfileHeader extends StatelessWidget {
  const ProfileHeader({
    required this.constraints,
    required this.uploadPictures,
    super.key,
    this.imageUrl,
  });

  final BoxConstraints constraints;
  final String? imageUrl;
  final Function(XFile? photo) uploadPictures;

  @override
  Widget build(final BuildContext context) => Container(
        color: AppColors.beige,
        height: constraints.maxHeight * 0.25,
        width: constraints.maxWidth,
        child: InkWell(
          onTap: () async {
            // showDialog(
            //   context: context,
            //   builder: (BuildContext context) => ImagePickerDialog(
            //     uploadPictures: uploadPictures,
            //   ),
            // );
          },
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              PersonIcon(
                imageUrl: imageUrl,
                size: imageUrl != null
                    ? IconSize.large * 9.0
                    : IconSize.large - 10.0,
              ),
              const SizedBox(height: Spacing.small),
              Text(
                t.profile.upload_profile_picture,
                style: const TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.w500,
                ),
              ),
            ],
          ),
        ),
      );
}
