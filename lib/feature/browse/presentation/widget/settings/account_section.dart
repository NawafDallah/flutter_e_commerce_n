import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_e_commerce_n_1/common/utils/extensions/translate_x_extension.dart';

import '../../../../../common/utils/functions/functions.dart';
import '../../../../../common/widgets/section_list.dart';
import '../../../../../config/routes/routes.dart';
import '../../bloc/settings/notification/notification_switch_cubit.dart';
import 'my_list_tile.dart';

class AccountSection extends StatelessWidget {
  const AccountSection({super.key});

  @override
  Widget build(BuildContext context) {
    final isArabic = NFunctions.isArabic(context);
    return SectionList(
      text: "myAccount".tr(context),
      tilesList: [
        // user profile
        GestureDetector(
          onTap: () {
            Navigator.pushNamed(context, Routes.profile);
          },
          child: MyListTile(
            color: Colors.amber.shade600,
            text: "profile".tr(context),
            leadingIcon: const Icon(
              CupertinoIcons.person_fill,
            ),
            trailing: Icon(
              isArabic ? Icons.keyboard_arrow_left : Icons.keyboard_arrow_right,
            ),
          ),
        ),

        // the notification
        MyListTile(
          color: Colors.red.shade600,
          text: "notification".tr(context),
          leadingIcon: const Icon(
            CupertinoIcons.bell_fill,
          ),
          trailing: BlocBuilder<NotificationSwitchCubit, bool>(
            builder: (context, state) {
              return CupertinoSwitch(
                value: state,
                onChanged: (bool value) {
                  context.read<NotificationSwitchCubit>().toggleSwitch();
                },
              );
            },
          ),
        ),

        // address
        MyListTile(
          color: Colors.blue.shade600,
          text: "address".tr(context),
          leadingIcon: const Icon(
            CupertinoIcons.location_solid,
          ),
          trailing: Icon(
            isArabic ? Icons.keyboard_arrow_left : Icons.keyboard_arrow_right,
          ),
        ),

        // peyment method cards
        MyListTile(
          color: Colors.blue.shade600,
          text: "peymentCards".tr(context),
          leadingIcon: const Icon(
            Icons.wallet,
          ),
          trailing: Icon(
            isArabic ? Icons.keyboard_arrow_left : Icons.keyboard_arrow_right,
          ),
        ),
      ],
    );
  }
}
