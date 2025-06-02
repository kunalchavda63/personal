import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:personal/features/panel_demo/provider/provider.dart';

import '../../core/app_ui/app_ui.dart';

class PanelDemo extends ConsumerStatefulWidget {
  const PanelDemo({super.key});

  @override
  ConsumerState<PanelDemo> createState() => _PanelDemoState();
}

class _PanelDemoState extends ConsumerState<PanelDemo> {
  late Size size;

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    size = MediaQuery.of(context).size;
  }

  @override
  Widget build(BuildContext context) {
    final localData = ref.watch(localDataProvider);
    return Scaffold(
      backgroundColor: AppColors.hex1212,
      appBar: CustomWidgets.customAppBar(
        autoImplyLeading: false,
        bgColor: AppColors.hex7777,
        title: CustomWidgets.customText(
          data: 'Local Api Demo',
          style: BaseStyle.s19w900.c(AppColors.hexF5f5),
        ),
      ),
      body: localData.when(
        data: (data) {
          return ListView.builder(
            itemCount: data.data?.length,
            itemBuilder: (context, index) {
              final user = data.data?[index];
              final company = user?.company;
              final address = user?.address;
              return CustomWidgets.customAnimationWrapper(
                animationType: AnimationType.slideFromTop,
                curve: Curves.decelerate,
                duration: Duration(milliseconds: 400),
                child: Stack(
                  clipBehavior: Clip.none,
                  children: [
                    CustomWidgets.customContainer(
                      clip: Clip.none,
                      h: 300,
                      w: size.width,
                      color: AppColors.hex2828,
                      border: Border.all(color: AppColors.white),
                      borderRadius: BorderRadius.circular(20),
                      padding: EdgeInsets.all(10),
                      child: Column(
                        children: [
                          Row(
                            children: [
                              CustomWidgets.customAnimationWrapper(
                                curve: Curves.easeInOut,
                                duration: Duration(milliseconds: 500),
                                animationType: AnimationType.fadeScale,
                                child: CustomWidgets.customContainer(
                                  h: 50,
                                  w: 50,
                                  color: AppColors.hex1212,
                                  boxShape: BoxShape.circle,
                                  alignment: Alignment.center,
                                  border: Border.all(color: AppColors.white),
                                  child: Text(
                                    user?.id.toString() ?? '',
                                    style: BaseStyle.s15w700.c(
                                      AppColors.hex1ed7,
                                    ),
                                  ),
                                ),
                              ),
                              Column(
                                mainAxisAlignment: MainAxisAlignment.start,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  CustomWidgets.customAnimationWrapper(
                                    curve: Curves.easeInOut,
                                    duration: Duration(milliseconds: 500),
                                    animationType: AnimationType.fadeScale,
                                    child: CustomWidgets.customText(
                                      data: user?.userName ?? 'Unknown',
                                      style: BaseStyle.s20w900.c(
                                        AppColors.hex1ed7,
                                      ),
                                    ).padLeft(10),
                                  ),
                                  CustomWidgets.customAnimationWrapper(
                                    curve: Curves.easeInOut,
                                    duration: Duration(milliseconds: 500),
                                    animationType: AnimationType.fadeScale,
                                    child: CustomWidgets.customText(
                                      data: user?.email ?? 'Unknown',
                                      style: BaseStyle.s11w700.c(
                                        AppColors.hexF5f5,
                                      ),
                                    ).padLeft(10),
                                  ),
                                ],
                              ),
                            ],
                          ).padBottom(20),
                          CustomWidgets.customAnimationWrapper(
                            animationType: AnimationType.fade,
                            curve: Curves.decelerate,
                            duration: Duration(seconds: 2),
                            child: CustomWidgets.customContainer(
                              h: 150,
                              w: size.width,
                              color: AppColors.black,
                              borderRadius: BorderRadius.circular(20),
                              border: Border.all(color: AppColors.white),
                              child: CustomWidgets.customAnimationWrapper(
                                child: CustomWidgets.customContainer(
                                  borderRadius: BorderRadius.circular(20),
                                  color: AppColors.white,
                                  padding: EdgeInsets.symmetric(
                                    horizontal: 20,
                                    vertical: 10,
                                  ),
                                  child: Column(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.center,
                                    children: [
                                      Row(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.center,
                                        children: [
                                          CustomWidgets.customIconWidget(
                                            icon: Icons.location_city,
                                            color: AppColors.hex1ed7,
                                          ).padRight(10),
                                          CustomWidgets.customText(
                                            data:
                                                "${address?.street} ${address?.suite}",
                                            style: BaseStyle.s14w500.c(
                                              AppColors.hex1212,
                                            ),
                                          ),
                                        ],
                                      ).padBottom(10),
                                      Row(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.center,
                                        children: [
                                          CustomWidgets.customIconWidget(
                                            icon: Icons.location_on_outlined,
                                            color: AppColors.black,
                                          ).padRight(10),
                                          CustomWidgets.customText(
                                            data: "${address?.city}",
                                            style: BaseStyle.s14w500.c(
                                              AppColors.hex1212,
                                            ),
                                          ),
                                        ],
                                      ).padBottom(10),
                                      Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceAround,
                                        crossAxisAlignment:
                                            CrossAxisAlignment.center,
                                        children: [
                                          Row(
                                            children: [
                                              CustomWidgets.customText(
                                                data: 'LAT',
                                                style: BaseStyle.s10w700,
                                              ).padRight(10),
                                              CustomWidgets.customText(
                                                data: "${address?.geo?.lat}",
                                                style: BaseStyle.s10w700.c(
                                                  AppColors.hex1212,
                                                ),
                                              ),
                                            ],
                                          ),
                                          Row(
                                            children: [
                                              CustomWidgets.customText(
                                                data: 'LON',
                                                style: BaseStyle.s10w700,
                                              ).padRight(10),
                                              CustomWidgets.customText(
                                                data: "${address?.geo?.lng}",
                                                style: BaseStyle.s10w700.c(
                                                  AppColors.hex1212,
                                                ),
                                              ),
                                            ],
                                          ),
                                        ],
                                      ),
                                    ],
                                  ),
                                ),
                              ).padH(10).padV(10),
                            ),
                          ).padBottom(10),
                          CustomWidgets.customAnimationWrapper(
                            child: Row(
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                CustomWidgets.customIconWidget(
                                  icon: Icons.warehouse_outlined,
                                  color: AppColors.hexF5f5,
                                ).padRight(10),
                                CustomWidgets.customText(
                                  data: company?.name ?? '',
                                  style: BaseStyle.s14w500.c(AppColors.hexF5f5),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ).padSymmetric(vertical: 20, horizontal: 20),
                    Positioned(
                      top: 10,
                      right: 15,
                      child: CustomWidgets.customAnimationWrapper(
                        animationType: AnimationType.fade,
                        duration: Duration(seconds: 5),
                        curve: Curves.decelerate,
                        child: CustomWidgets.customImageView(
                          sourceType: ImageType.asset,
                          fit: BoxFit.fill,
                          height: 100,
                          width: 200,

                          path: AssetImages.imgGreenLeaf,
                        ),
                      ),
                    ),
                  ],
                ),
              );
            },
          );
        },
        loading: () => CircularProgressIndicator(),
        error: (e, _) => Text('Unexpected Error: $e'),
      ),
    );
  }
}
