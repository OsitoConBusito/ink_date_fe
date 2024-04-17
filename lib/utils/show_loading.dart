import 'package:flutter/material.dart';

import '../shared/widgets/loading_screen.dart';

Future<void> showLoading(BuildContext context) async => showDialog<void>(
      context: context,
      barrierDismissible: false,
      useSafeArea: false,
      builder: (BuildContext context) => const Dialog(
        insetPadding: EdgeInsets.zero,
        backgroundColor: Colors.transparent,
        child: LoadingScreen(),
      ),
    );
