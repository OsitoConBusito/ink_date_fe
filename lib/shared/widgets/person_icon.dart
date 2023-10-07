import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

import '../../theme/theme.dart';

class PersonIcon extends StatelessWidget {
  const PersonIcon({
    required this.size,
    super.key,
    this.imageUrl,
  });

  final String? imageUrl;
  final double size;

  @override
  Widget build(final BuildContext context) => ClipOval(
        child: imageUrl != null
            ? CachedNetworkImage(
                fit: BoxFit.cover,
                height: size * 0.2,
                imageUrl: imageUrl!,
                placeholder: (final BuildContext context, final String url) =>
                    const CircularProgressIndicator(),
                width: size * 0.2,
              )
            : CircleAvatar(
                backgroundColor: AppColors.backgroundIcon,
                minRadius: size,
                child: Icon(
                  Icons.person,
                  color: Colors.white,
                  size: size,
                ),
              ),
      );
}
