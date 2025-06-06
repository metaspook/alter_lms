import 'package:domain/domain.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:uikit/uikit.dart';
import 'package:user_app/modules/dashboard/dashboard.dart';
import 'package:utils/utils.dart';

class DashboardView extends StatelessWidget {
  const DashboardView({super.key});

  @override
  Widget build(BuildContext context) {
    final l10n = context.l10n;
    return Scaffold(
      drawer: const Drawer(),
      appBar: AppBar(
        title: const Text('Dashboard'),
        centerTitle: true,
        actionsPadding: AppThemes.actionsPadding,
        actions: [
          HaloAvatar(
            imageBuilder: Assets.images.user1.image,
            aspectRatioPercent: 90,
          ),
        ],
      ),
      body: ListView(
        // mainAxisSize: MainAxisSize.min,
        children: [
          // ConstrainedBox(
          //   constraints: const BoxConstraints(maxHeight: 200),
          //   child: CarouselView(
          //     itemExtent: 330,
          //     shrinkExtent: 200,
          //     padding: const EdgeInsets.all(10),
          //     children: List.generate(
          //       10,
          //       (index) => Image.network(
          //         'https://picsum.photos/200/300',
          //         fit: BoxFit.cover,
          //       ),
          //     ),
          //   ),
          // ),
          BlocSelector<DashboardCubit, DashboardState, List<AppNotification>>(
            selector: (state) =>
                state.appNotifications.where((an) => an.type.isEvent).toList(),
            builder: (context, eventNotifications) {
              return UpcomingEventsCard(eventNotifications: eventNotifications);
            },
          ),
          Expanded(
            child: GridView.builder(
              physics: const NeverScrollableScrollPhysics(),
              shrinkWrap: true,
              padding: const EdgeInsets.all(appSpacing * 2),
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                crossAxisSpacing: appSpacing * 1.5,
                mainAxisSpacing: appSpacing * 1.5,
                // childAspectRatio: 2,
                mainAxisExtent: 100,
              ),
              itemCount: _buildGridMenus().length,
              itemBuilder: (context, index) {
                return Card(
                  child: Padding(
                    padding: const EdgeInsets.symmetric(vertical: appSpacing),
                    child: Column(
                      spacing: appSpacing * .25,
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Expanded(
                          child: SvgPicture.asset(
                            _buildGridMenus()[index].imageName!,
                          ),
                        ),
                        Text(l10n.resolve(_buildGridMenus()[index].key)),
                      ],
                    ),
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}

List<Menu> _buildGridMenus() {
  return [
    Menu(id: uuid(), key: 'liveClass', imageName: Assets.icons.liveClass),
    Menu(id: uuid(), key: 'shop', imageName: Assets.icons.shop),
    Menu(id: uuid(), key: 'courses', imageName: Assets.icons.courses),
    Menu(id: uuid(), key: 'students', imageName: Assets.icons.students),
    Menu(id: uuid(), key: 'groups', imageName: Assets.icons.groups),
    Menu(id: uuid(), key: 'profile', imageName: Assets.icons.profile),
    Menu(id: uuid(), key: 'settings', imageName: Assets.icons.settings),
    Menu(id: uuid(), key: 'Mind Games', imageName: Assets.icons.settings),
  ];
}
