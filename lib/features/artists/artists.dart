import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:personal/core/app_ui/src/widgets/src/app_outline_input_border.dart';
import 'package:personal/core/services/network/base/app_dio_manager.dart';
import 'package:personal/features/artists/provider/provider.dart';

import '../../core/app_ui/app_ui.dart';
import '../../core/utilities/utils.dart';

class Artists extends ConsumerStatefulWidget {
  const Artists({super.key});

  @override
  ConsumerState<Artists> createState() => _ArtistsState();
}

class _ArtistsState extends ConsumerState<Artists> {
  final TextEditingController titleController = TextEditingController();
  final TextEditingController subTitleController = TextEditingController();

  final OutlinedInputBorder border = OutlinedInputBorder(
    borderRadius: BorderRadius.circular(8),
    borderSide: BorderSide(color: AppColors.hex1ed7),
  );

  final OutlinedInputBorder noteBorder = OutlinedInputBorder(
    borderRadius: BorderRadius.circular(8),
    borderSide: BorderSide(color: AppColors.hex1ed7),
  );

  @override
  Widget build(BuildContext context) {
    final todoList = ref.watch(notesProvider);
    final operation = ref.read(notesProvider.notifier);

    void addNote(String title, String subtitle) {
      operation.addNote(title, subtitle);
    }

    // void remove(String id) {
    //   operation.remove(id);
    // }

    return Scaffold(
      backgroundColor: AppColors.hex1212,
      appBar: CustomWidgets.customAppBar(
        title: Text('Todo App', style: BaseStyle.s16w900.c(AppColors.white)),
        bgColor: AppColors.hex1212,
        elevation: 100,
      ),
      floatingActionButton: CustomWidgets.customFloatingActionButton(
        backgroundColor: AppColors.hex2828,
        label: 'g',
        onTap: () async {
          // showDialog(
          //   context: context,
          //   builder: (context) {
          //     return Dialog(
          //       alignment: Alignment.center,
          //       insetPadding: EdgeInsets.all(20),
          //       child: CustomWidgets.customContainer(
          //         border: Border.all(color: Colors.yellow.withAlpha(55)),
          //         borderRadius: BorderRadius.circular(10),
          //         h: MediaQuery.of(context).size.height * 0.45,
          //         w: isWindows ? MediaQuery.of(context).size.width * 0.30 : 300,
          //         color: AppColors.hex2828,
          //         child: Column(
          //           crossAxisAlignment: CrossAxisAlignment.start,
          //           children: [
          //             CustomWidgets.customText(
          //               data: 'Add Todo',
          //               style: BaseStyle.s19w900.c(AppColors.white).w(400),
          //             ).padLeft(20).padV(20),
          //
          //             CustomWidgets.customText(
          //               data: 'Title',
          //               style: BaseStyle.s16w900.c(AppColors.hex1ed7).w(400),
          //             ).padLeft(10),
          //             CustomWidgets.customTextField(
          //               fillColor: AppColors.hex1212,
          //               controller: titleController,
          //               filled: true,
          //               border: noteBorder,
          //               hintText: 'Title',
          //               hintStyle: BaseStyle.s16w900.c(AppColors.white).w(400),
          //               style: BaseStyle.s16w900.c(AppColors.white).w(500),
          //             ).padH(10).padV(10).padBottom(10),
          //
          //             CustomWidgets.customText(
          //               data: 'Description',
          //               style: BaseStyle.s16w900.c(AppColors.hex1ed7).w(400),
          //             ).padLeft(10),
          //             CustomWidgets.customTextField(
          //               fillColor: AppColors.hex1212,
          //               controller: subTitleController,
          //               filled: true,
          //               border: noteBorder,
          //               hintText: 'Description',
          //               hintStyle: BaseStyle.s16w900.c(AppColors.white).w(400),
          //               style: BaseStyle.s16w900.c(AppColors.white).w(500),
          //             ).padH(10).padV(10).padBottom(20),
          //             Center(
          //               child: CustomWidgets.customContainer(
          //                 onTap: () {
          //                   var title = titleController.text.trim();
          //                   var subTitle = subTitleController.text.trim();
          //                   if (title.isNotEmpty || subTitle.isNotEmpty) {
          addNote('Post', 'Description');
          // }
          // titleController.clear();
          // subTitleController.clear();
          //
          // context.pop();
          // },
          // h: 40,
          // w: 100,
          // color: AppColors.hex1212,
          // borderRadius: BorderRadius.circular(10),
          // border: Border.all(color: AppColors.hex1ed7),
          // alignment: Alignment.center,
          // child: Text(
          //   'Submit',
          //   style: BaseStyle.s14w500.c(AppColors.white),
          // ),
          // ),
          // ),
          // ],
          // ),
          // ),
          // );
          // },
          // );
          fetchData();

          // addNote();
          log('Press Btn');
        },
        child: Icon(Icons.add, color: AppColors.white),
      ),
      body: Column(
        children: [
          CustomWidgets.customTextField(
            filled: true,
            hintText: AppStrings.search,
            padding: EdgeInsets.symmetric(vertical: 12),
            fillColor: AppColors.hexF5f5,
            border: border,
            hintStyle: BaseStyle.s14w500.c(AppColors.black),
            prefixIcon: SvgPicture.asset(
              height: 17,
              width: 17,
              fit: BoxFit.contain,
              colorFilter: ColorFilter.mode(AppColors.hex7777, BlendMode.srcIn),
              AssetIcons.icSearch,
            ).padV(12),
          ).padH(15).padV(10),
          Expanded(
            child: ListView.builder(
              padding: EdgeInsets.only(bottom: 20),
              shrinkWrap: true,
              itemCount: todoList.length,
              itemBuilder: (context, index) {
                if (todoList.isEmpty || todoList.length == 0) {
                  log('No Lists found');
                  return Center(
                    child: CustomWidgets.customText(data: 'Empty List'),
                  );
                }
                final note = todoList[index];
                return CustomWidgets.customContainer(
                  h: 200,
                  borderRadius: BorderRadius.circular(20),
                  border: Border.all(color: AppColors.hexF5f5),
                  child: Column(
                    children: [
                      Row(
                        children: [
                          CustomWidgets.customText(
                            data: "${note.title} ${index + 1}" ?? '',
                            style: BaseStyle.s20w900.c(AppColors.white),
                          ).padLeft(10),
                        ],
                      ),
                    ],
                  ),
                ).padV(10).padH(10);
              },
            ),
          ),
        ],
      ),
    );
  }
}
