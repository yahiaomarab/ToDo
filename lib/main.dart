import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:todo_apps/presentation/layout_screen/layout_screen.dart';
import 'package:todo_apps/view_model/task_cubit/task_cubit.dart';
import 'package:todo_apps/view_model/task_cubit/task_states.dart';
import 'package:todo_apps/widgets/themes/Themes/dark_Theme.dart';
import 'package:todo_apps/widgets/themes/Themes/light_Theme.dart';
import 'data/resource/local/sharedprefrence_helper.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await AdvancedSharedPreferences.init();
  bool isDark = await AdvancedSharedPreferences.getBool("isDark");
  runApp(MyApp(isDark));
}

class MyApp extends StatelessWidget {
  final bool isDark;
  MyApp(this.isDark);
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
            create: (context) => AddTaskCubit()
              ..getAllTasks()
              ..changeMode(context, fromShare: isDark)
        ),
      ],
      child: BlocConsumer<AddTaskCubit, AddTaskStates>(
        listener: (context, state) {},
        builder: (context, state) => MaterialApp(
          home: LayoutScreen(),
          debugShowCheckedModeBanner: false,
          themeMode: AddTaskCubit.get(context).isDark
              ? ThemeMode.dark
              : ThemeMode.light,
          darkTheme: darkTheme,
          theme: lightTheme,
        ),
      ),
    );
  }
}
