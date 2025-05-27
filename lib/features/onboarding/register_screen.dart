import 'dart:developer';

import 'package:flutter_svg/flutter_svg.dart';
import 'package:go_router/go_router.dart';
import 'package:personal/core/app_ui/app_ui.dart';
import 'package:personal/core/services/navigation/src/route_constants.dart';
import 'package:personal/core/utilities/utils.dart';

class RegisterScreen extends StatefulWidget {
  const RegisterScreen({super.key});

  @override
  State<RegisterScreen> createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final TextEditingController genderController = TextEditingController();
  final TextEditingController nameController = TextEditingController();
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  List<RegisterPage> registerProcess = [];
  late Size size;

  @override
  void initState() {
    super.initState();

    registerProcess = [
      RegisterPage(
        title: AppStrings.whatIsUMail,
        controller: emailController,
        subTitle: AppStrings.youWillNeedEmailLater,
        validator: validateEmail,
        textInputType: TextInputType.emailAddress,
      ),
      RegisterPage(
        title: AppStrings.createAPassword,
        controller: passwordController,
        textInputType: TextInputType.visiblePassword,
        subTitle: AppStrings.useAtLeastCharacter,
        validator: validatePassword,
      ),
      RegisterPage(
        title: AppStrings.whatIsUGender,
        controller: genderController,
        validator: validateGender,
        textInputType: TextInputType.text,
      ),
      RegisterPage(
        title: AppStrings.whatIsUName,
        controller: nameController,
        textInputType: TextInputType.text,
        subTitle: AppStrings.thisAppearsOnYourSpotifyProfile,
        validator: validateName,
      ),
    ];

    for (var page in registerProcess) {
      page.controller.addListener(() => setState(() {}));
    }
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    size = MediaQuery.of(context).size;
  }

  final PageController _pageController = PageController();

  final border = OutlinedInputBorder(
    borderRadius: BorderRadius.circular(5),
    borderSide: BorderSide(color: AppColors.transparent),
  );

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      backgroundColor: AppColors.hex1212,
      appBar: AppBar(
        backgroundColor: AppColors.hex1212,
        bottomOpacity: 0,
        elevation: 0,
        scrolledUnderElevation: 0,
        centerTitle: true,
        leading: CustomWidgets.customCircleBackButton().padLeft(21),
        title: Text(
          AppStrings.createAccount,
          style: BaseStyle.s16w900.c(AppColors.white),
        ),
      ),

      body: Form(
        key: _formKey,
        child: PageView.builder(
          controller: _pageController,
          physics: NeverScrollableScrollPhysics(),
          itemCount: registerProcess.length,
          itemBuilder: (context, index) {
            return Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  registerProcess[index].title,
                  style: BaseStyle.s20w900.c(AppColors.white),
                ).padTop(25),
                CustomWidgets.customTextField(
                  controller: registerProcess[index].controller,
                  filled: true,
                  padding: EdgeInsets.symmetric(
                    vertical: size.height * 0.015,
                    horizontal: size.width * 0.02,
                  ),
                  textInputType: registerProcess[index].textInputType,
                  // validator: registerProcess[index].validator,
                  border: border,
                  style: BaseStyle.s17w900.c(AppColors.white),
                  suffixIcon:
                      index > 1
                          ? SvgPicture.asset(AssetIcons.icTick).padAll(15)
                          : SizedBox(),
                  fillColor: AppColors.hex7777,
                ).padBottom(20),
                if (registerProcess[index].subTitle != null)
                  Text(
                    registerProcess[index].subTitle!,
                    style: BaseStyle.s8w700.c(AppColors.white),
                  ).padBottom(43),
                if (index == 3)
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Divider(color: AppColors.hex7777).padBottom(24),
                      Text(
                        AppStrings.byTappingOnCreateAccountYouAgreeTerms,
                        style: BaseStyle.s10w700.c(AppColors.white),
                      ).padBottom(32),
                      Text(
                        AppStrings.termsOfUse,
                        style: BaseStyle.s10w700.c(AppColors.hex1ed7),
                      ).padBottom(32),
                      Text(
                        AppStrings.toLearnMoreAboutHowSpotifyCollectUses,
                        style: BaseStyle.s10w700.c(AppColors.white),
                      ).padBottom(32),
                      Text(
                        AppStrings.privacyPolicy,
                        style: BaseStyle.s10w700.c(AppColors.hex1ed7),
                      ).padBottom(32),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            AppStrings.pleaseSendMeNews,
                            style: BaseStyle.s10w700.c(AppColors.white),
                          ),
                          Radio(
                            value: false,
                            activeColor: AppColors.white,
                            groupValue: false,
                            onChanged: (val) {},
                          ),
                        ],
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Expanded(
                            child: Text(
                              AppStrings.shareMyRegistrationDataWithSpotify,
                              style: BaseStyle.s10w700.c(AppColors.white),
                            ),
                          ),
                          Radio(
                            value: false,
                            activeColor: AppColors.white,
                            groupValue: false,
                            onChanged: (val) {},
                          ),
                        ],
                      ),
                    ],
                  ),

                if (index == 3) Expanded(child: SizedBox()),

                Center(
                  child: CustomWidgets.customContainer(
                    h: 42,
                    w: index == 3 ? 180 : 82,
                    onTap: () {
                      if (_formKey.currentState!.validate()) {
                        if (index < registerProcess.length - 1) {
                          _pageController.nextPage(
                            duration: Duration(milliseconds: 300),
                            curve: Curves.easeInOut,
                          );
                        } else if (index == 3) {
                          context.push(RoutesEnum.artists.path);
                        } else {
                          log('Please fill valid data');
                        }
                      }
                    },
                    color:
                        registerProcess[index].controller.text.trim().isEmpty
                            ? AppColors.hex5353
                            : index == 3
                            ? AppColors.white
                            : AppColors.hex7777,
                    borderRadius: BorderRadius.circular(21),
                    alignment: Alignment.center,
                    child: Text(
                      index == 3 ? AppStrings.createAnAccount : AppStrings.next,
                      style: BaseStyle.s15w700.c(AppColors.black),
                    ),
                  ),
                ).padBottom(index == 3 ? 84 : 0),
              ],
            ).padH(31);
          },
        ),
      ),
    );
  }
}

class RegisterPage {
  final String title;
  final TextEditingController controller;
  final String? subTitle;
  final TextInputType? textInputType;
  final String? Function(String?)? validator;

  RegisterPage({
    required this.title,
    this.validator,
    this.textInputType,
    required this.controller,
    this.subTitle,
  });
}
