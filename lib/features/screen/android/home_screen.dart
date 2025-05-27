import 'package:personal/core/app_ui/app_ui.dart';

class AHomeScreen extends StatefulWidget {
  const AHomeScreen({super.key});

  @override
  State<AHomeScreen> createState() => _AHomeScreenState();
}

class _AHomeScreenState extends State<AHomeScreen> {
  late Size size;

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    size = MediaQuery.of(context).size;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.hex1212,
      drawer: Drawer(
        backgroundColor: AppColors.hex3E3f,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.only(
            topRight: Radius.circular(10),
            bottomRight: Radius.circular(10),
          ),
        ),
        width: size.width * 0.9,
      ),
      appBar: CustomWidgets.customAppBar(
        height: 100,
        bgColor: AppColors.hex1212,
        title: Row(
          children: [
            appbarRow(),
            appbarRow(
              text: 'Music',
              textColor: AppColors.white,
              bgColor: AppColors.hex3E3f,
            ),
            appbarRow(
              text: 'Podcasts',
              textColor: AppColors.white,
              bgColor: AppColors.hex3E3f,
            ),
          ],
        ),
        autoImplyLeading: false,
        leading: Builder(
          builder:
              (context) => GestureDetector(
                onTap: () => Scaffold.of(context).openDrawer(),
                child: CustomWidgets.customContainer(
                  h: 30,
                  w: 50,
                  alignment: Alignment.center,
                  child: CustomWidgets.customText(
                    data: 'K',
                    style: BaseStyle.s16w900.c(AppColors.hex2828),
                  ),
                  color: Colors.lightBlue,
                  boxShape: BoxShape.circle,
                ).padLeft(20),
              ),
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            GridView.builder(
              physics: NeverScrollableScrollPhysics(),
              shrinkWrap: true,
              itemCount: 8,
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                crossAxisSpacing: 10,
                childAspectRatio: size.height * 0.009 * 0.5,
                mainAxisSpacing: 10,
              ),
              itemBuilder: (context, index) {
                return recentAlbumPlaylistCard();
              },
            ).padSymmetric(horizontal: 20).padBottom(30),
            CustomWidgets.customText(
              data: 'Popular albums and sigles',
              style: BaseStyle.s23w900.c(AppColors.white),
            ).padLeft(20),
            SizedBox(
              height: 280,
              child: ListView.builder(
                shrinkWrap: true,
                itemCount: 5,
                scrollDirection: Axis.horizontal,
                itemBuilder: (context, index) {
                  return CustomWidgets.customPlaylistCard().padRight(20);
                },
              ).padLeft(20),
            ).padTop(10),
          ],
        ),
      ),
    );
  }

  Widget appbarRow({String? text, Color? bgColor, Color? textColor}) {
    return CustomWidgets.customContainer(
      h: 30,
      padding: EdgeInsets.symmetric(horizontal: 15, vertical: 8),
      color: bgColor ?? AppColors.hex1ed7,
      alignment: Alignment.center,
      borderRadius: BorderRadius.circular(1305),
      child: CustomWidgets.customText(
        data: text ?? 'All',
        style: BaseStyle.s14w500.c(textColor ?? AppColors.hex1212),
      ),
    ).padRight(10);
  }

  Widget recentAlbumPlaylistCard({dynamic t}) {
    return CustomWidgets.customContainer(
      padding: EdgeInsets.only(right: 5),
      borderRadius: BorderRadius.circular(8),
      color: AppColors.hex3E3f,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Thumbnail
          CustomWidgets.customContainer(
            h: size.height * 0.10,
            w: size.width * 0.10,
            color: AppColors.hexF5f5,
            borderRadius: BorderRadius.circular(5),
            child: CustomWidgets.customImageView(
              sourceType: ImageType.network,
              path:
                  'https://img.freepik.com/free-photo/3d-music-related-scene_23-2151124956.jpg?ga=GA1.1.709110294.1727162328&semt=ais_items_boosted&w=740',
              fit: BoxFit.cover,
            ),
          ),
          SizedBox(width: 8),
          Expanded(
            child: Center(
              child: CustomWidgets.customText(
                data: '90s bollywood',
                style: BaseStyle.s15w700.c(AppColors.white),
                maxLines: 2,
                softWrap: true,
                overflow: TextOverflow.ellipsis,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
