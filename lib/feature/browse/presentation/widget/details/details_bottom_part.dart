import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_e_commerce_n_1/common/utils/extensions/translate_x_extension.dart';

import '../../../../../common/utils/constants/colors.dart';
import '../../../../../common/utils/constants/sizes.dart';
import '../../../../../common/utils/functions/functions.dart';
import '../../bloc/browse/detail_counter/details_counter_cubit.dart';

class DetailsBottomPart extends StatelessWidget {
  const DetailsBottomPart({super.key});

  @override
  Widget build(BuildContext context) {
    final screenWidth = NFunctions.screenWidth(context);
    return Padding(
      padding: const EdgeInsets.all(NSizes.md),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Row(
            children: [
              IconButton(
                onPressed: () {
                  context.read<DetailsCounterCubit>().decriment();
                },
                style: ButtonStyle(
                  fixedSize: const WidgetStatePropertyAll(Size(50, 50)),
                  backgroundColor: WidgetStatePropertyAll(
                    NColors.grey.withOpacity(0.5),
                  ),
                ),
                icon: const Icon(CupertinoIcons.minus),
              ),
              const SizedBox(width: NSizes.ms),
              BlocBuilder<DetailsCounterCubit, int>(
                builder: (context, state) {
                  return Text(
                    state.toString(),
                    style: Theme.of(context).textTheme.headlineSmall,
                  );
                },
              ),
              const SizedBox(width: NSizes.ms),
              IconButton(
                onPressed: () {
                  context.read<DetailsCounterCubit>().incriment();
                },
                style: ButtonStyle(
                  fixedSize: const WidgetStatePropertyAll(Size(50, 50)),
                  backgroundColor: WidgetStatePropertyAll(
                    NColors.darkerGrey.withOpacity(0.5),
                  ),
                ),
                icon: const Icon(CupertinoIcons.add),
              ),
            ],
          ),
          BlocBuilder<DetailsCounterCubit, int>(
            builder: (context, state) {
              return ElevatedButton(
                onPressed: state == 0 ? null : () {},
                style: ButtonStyle(
                  fixedSize: WidgetStatePropertyAll(
                    Size(screenWidth * 0.5, 50),
                  ),
                  padding: const WidgetStatePropertyAll(
                    EdgeInsets.all(NSizes.md),
                  ),
                ),
                child: Text("addToCart".tr(context)),
              );
            },
          )
        ],
      ),
    );
  }
}
