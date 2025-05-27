import 'dart:developer';

import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:personal/core/services/network/base/app_dio_manager.dart';
import 'package:personal/core/utilities/src/app_url.dart';
import 'package:personal/features/artists/provider/provider.dart';
import 'package:url_launcher/url_launcher.dart';

import '../../core/app_ui/app_ui.dart';
import '../../core/utilities/utils.dart';

class Artists extends ConsumerStatefulWidget {
  const Artists({super.key});

  @override
  ConsumerState<Artists> createState() => _ArtistsState();
}

class _ArtistsState extends ConsumerState<Artists> {
  late Size size;

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    size = MediaQuery.of(context).size;
  }

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
    const imageData =
        'https://images.pexels.com/photos/206901/pexels-photo-206901.jpeg?auto=compress&cs=tinysrgb&w=1200';
    final todoList = ref.watch(notesProvider);
    final operation = ref.read(notesProvider.notifier);

    void addNote(String title, String subtitle) {
      operation.addNote(title, subtitle);
    }

    void toggleLike(String id, bool? isLiked) {
      operation.toggleLike(id, isLiked);
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
          addNote('Post', 'Description');
          fetchData();

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
                return CustomWidgets.customAnimationWrapper(
                  animationType: AnimationType.scale,
                  duration: Duration(milliseconds: 900),
                  curve: Curves.decelerate,
                  child: CustomWidgets.customContainer(
                    padding: EdgeInsets.all(10),
                    alignment: Alignment.center,
                    borderRadius: BorderRadius.circular(20),
                    border: Border.all(color: AppColors.hexF5f5),
                    child: Column(
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            CustomWidgets.customText(
                              data: "${note.title} ${index + 1}",
                              style: BaseStyle.s20w900.c(AppColors.hex1ed7),
                            ),
                            CustomWidgets.customIconWidget(
                              icon: Icons.drag_indicator,
                              color: AppColors.hex1ed7,
                            ),
                          ],
                        ),
                        CustomWidgets.customContainer(
                          h: 200,
                          w: size.width,
                          child: CustomWidgets.customImageView(
                            fit: BoxFit.cover,
                            path: imageData,
                            sourceType: ImageType.network,
                          ),
                        ),
                        CustomWidgets.customContainer(
                          h: 60,
                          w: size.width,
                          color: AppColors.hex1212,
                          child: Row(
                            children: [
                              Row(
                                children: [
                                  InkWell(
                                    onTap: () {
                                      toggleLike(note.id, note.isLiked);
                                    },
                                    child: CustomWidgets.customIconWidget(
                                      icon:
                                          note.isLiked == true
                                              ? Icons.circle
                                              : Icons.circle_outlined,
                                      color: AppColors.hex1ed7,
                                    ).padLeft(10),
                                  ).padRight(10),
                                  CustomWidgets.customText(
                                    data: '1',
                                    style: BaseStyle.s19w900.c(
                                      AppColors.hex1ed7,
                                    ),
                                  ),
                                ],
                              ).padRight(10),
                              Row(
                                children: [
                                  CustomWidgets.customIconWidget(
                                    icon: Icons.comment_outlined,
                                    color: AppColors.hex1ed7,
                                  ).padRight(10),
                                  CustomWidgets.customText(
                                    data: '1',
                                    style: BaseStyle.s19w900.c(
                                      AppColors.hex1ed7,
                                    ),
                                  ),
                                ],
                              ).padRight(10),
                              Row(
                                children: [
                                  InkWell(
                                    onTap: () {
                                      const data = imageData;
                                      context.showCustomBottomSheet(
                                        bgColor: AppColors.hex1212,
                                        child: Column(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.stretch,
                                          children: [
                                            CustomWidgets.customText(
                                              data: AppStrings.share,
                                              style: BaseStyle.s10w700.c(
                                                AppColors.white,
                                              ),
                                            ),
                                            CustomWidgets.customCanCopyText(
                                              data,
                                            ).padTop(20),
                                            Row(
                                              mainAxisAlignment:
                                                  MainAxisAlignment
                                                      .spaceBetween,
                                              children: [
                                                customCircleIcon(
                                                  data: 'C',
                                                  onTap:
                                                      () =>
                                                          launchUri(imageData),
                                                ),
                                                customCircleIcon(
                                                  data: 'F',
                                                  onTap:
                                                      () => launchUri(
                                                        AppUrl.gmail,
                                                      ),
                                                ),
                                                customCircleIcon(
                                                  data: 'M',
                                                  onTap:
                                                      () => launchUri(
                                                        AppUrl.pubDev,
                                                      ),
                                                ),
                                                customCircleIcon(
                                                  data: 'W',
                                                  onTap:
                                                      () => launchUrl(
                                                        Uri.parse(
                                                          AppUrl.phoneCall,
                                                        ),
                                                      ),
                                                ),
                                              ],
                                            ).padTop(40),
                                          ],
                                        ).padH(20).padV(20),
                                      );
                                    },
                                    child: CustomWidgets.customIconWidget(
                                      icon: Icons.share,
                                      color: AppColors.hex1ed7,
                                    ).padRight(10),
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ).padV(10).padH(10),
                );
              },
            ),
          ),
        ],
      ),
    );
  }

  Widget customCircleIcon({String? data, VoidCallback? onTap}) {
    return CustomWidgets.customContainer(
      onTap: onTap,
      h: 50,
      w: 50,
      alignment: Alignment.center,
      boxShape: BoxShape.circle,
      color: AppColors.hex7777,
      child: CustomWidgets.customText(
        data: data ?? '',
        style: BaseStyle.s19w900.c(AppColors.white),
      ),
    );
  }
}
