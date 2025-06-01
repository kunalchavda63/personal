import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:personal/features/panel_demo/provider/provider.dart';

import '../../core/app_ui/app_ui.dart';

class PanelDemo extends ConsumerStatefulWidget {
  const PanelDemo({super.key});

  @override
  ConsumerState<PanelDemo> createState() => _PanelDemoState();
}

class _PanelDemoState extends ConsumerState<PanelDemo> {
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
              return ListTile();
            },
          );
        },
        loading: () => CircularProgressIndicator(),
        error: (e, _) => Text('Unexpected Error: $e'),
      ),
    );
  }
}
