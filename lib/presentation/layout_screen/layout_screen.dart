import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:intl/intl.dart';
import 'package:todo_apps/presentation/addTask_screen/addTask_screen.dart';
import '../../data/models/task_model.dart';
import '../../view_model/task_cubit/task_cubit.dart';
import '../../view_model/task_cubit/task_states.dart';
import '../../widgets/themes/colors/HexColors.dart';
import '../../widgets/component/Reuse_Component.dart';
import '../search_screen/search_screen.dart';

class LayoutScreen extends StatelessWidget {
  DateTime selectedDate = DateTime.now();
  bool shbottomsh = true;
  List<TaskModel> Tasks = [];
  var titleController = TextEditingController();
  var Scaffoldkey = GlobalKey<ScaffoldState>();

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => AddTaskCubit()..getAllTasks(),
      child: BlocConsumer<AddTaskCubit, AddTaskStates>(
          listener: (context, state) {},
          builder: (context, state) {
            AddTaskCubit cubit = AddTaskCubit.get(context);
            return Scaffold(
              key: Scaffoldkey,
              appBar: appbar(
                iconLead: Icon(Icons.light_mode_outlined),
                onpressed: () {
                  cubit.changeMode(context);
                },
                onButtonPress: () {
                  navTo(context, SearchScreen());
                },
              ),
              body: Container(
                padding: EdgeInsets.only(right: 20, left: 10, top: 5),
                child: Column(
                  children: [
                    addTaskBar(context),
                    SizedBox(
                      height: 10,
                    ),
                    if (cubit.tasks.length == 0) noTaskMsg(context),
                    Expanded(
                        child: ListView.separated(
                            itemBuilder: (context, index) =>
                                Tasktile(context, cubit.tasks[index]),
                            separatorBuilder: (context, index) => SizedBox(
                                  height: 10,
                                ),
                            itemCount: cubit.tasks.length)),
                  ],
                ),
              ),
            );
          }),
    );
  }

  Widget addTaskBar(context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              DateFormat.yMMMd().format(DateTime.now()),
            ),
            SizedBox(
              height: 5,
            ),
            Text('Today'),
          ],
        ),
        Spacer(),
        Button(
            label: '+ AddTask',
            onTap: () {
              navTo(context, AddTaskScreen());
            })
      ],
    );
  }

  Widget noTaskMsg(context) {
    return Container(
      child: Stack(
        children: [
          SingleChildScrollView(
            child: Wrap(
              direction: Axis.horizontal,
              alignment: WrapAlignment.center,
              crossAxisAlignment: WrapCrossAlignment.center,
              children: [
                MediaQuery.of(context).orientation == Orientation.landscape
                    ? SizedBox(height: 10)
                    : SizedBox(height: 200),
                SvgPicture.asset(
                  'assets/images/notask.svg',
                  height: 150,
                  width: 100,
                  color: bluishClr.withOpacity(0.5),
                ),
                Padding(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 30, vertical: 10),
                  child: Text(
                    'No tasks created yet ! \n  create your own taskes from click addtask button',
                    textAlign: TextAlign.center,
                    style: Theme.of(context).textTheme.caption,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget Tasktile(context, TaskModel model) {
    return GestureDetector(
      onTap: () {
        Scaffoldkey.currentState!.showBottomSheet((context) {
          return Container(
            height: 300,
            color: darkGreyClr,
            padding: EdgeInsets.only(top: 30, bottom: 20, right: 30, left: 30),
            child: Column(
              children: [
                longButton(
                  label: 'update',
                  onTap: () {
                    showDialog(
                        context: context,
                        builder: (BuildContext context) {
                          return BlocProvider(
                            create: (context) => AddTaskCubit()..getAllTasks(),
                            child: BlocConsumer<AddTaskCubit, AddTaskStates>(
                              listener: (context, state) {
                                if (state is UpdatingDatabaseSuccessfully)
                                  navTo(context, LayoutScreen());
                              },
                              builder: (context, state) {
                                return Container(
                                  height: 100,
                                  padding: EdgeInsets.all(10),
                                  margin: EdgeInsets.only(
                                      bottom: 200,
                                      top: 100,
                                      left: 50,
                                      right: 50),
                                  width: 500,
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(30),
                                    color: Colors.white,
                                  ),
                                  child: Column(
                                    children: [
                                      Dialog(
                                        child: Container(
                                          height: 60,
                                          width: 450,
                                          decoration: BoxDecoration(
                                            borderRadius:
                                                BorderRadius.circular(10),
                                          ),
                                          child: TextFormField(
                                            controller: titleController,
                                            decoration: InputDecoration(
                                                labelText: 'title',
                                                prefixIcon: Icon(
                                                  Icons.title,
                                                  color: Colors.black,
                                                ),
                                                border: OutlineInputBorder()),
                                            keyboardType: TextInputType.text,
                                          ),
                                        ),
                                      ),
                                      Button(
                                          label: 'Ok',
                                          onTap: () {
                                            AddTaskCubit.get(context)
                                                .updateDatabase(
                                              model.id!,
                                              TaskModel(
                                                id: model.id!,
                                                remind: model.remind,
                                                title: titleController.text,
                                                note: model.note,
                                                startTime: model.startTime,
                                                endTime: model.endTime,
                                                date: model.date,
                                                repeat: model.repeat,
                                              ),
                                            );
                                          }),
                                    ],
                                  ),
                                );
                              },
                            ),
                          );
                        });
                  },
                ),
                SizedBox(
                  height: 10,
                ),
                longButton(
                  label: 'Delete Task',
                  onTap: () {
                    AddTaskCubit.get(context).deleteDatabase(model.id!);
                    Navigator.pop(context);
                  },
                ),
                SizedBox(
                  height: 10,
                ),
                DevidorLine(context),
                SizedBox(
                  height: 20,
                ),
                longButton(
                  label: 'cancel',
                  onTap: () {
                    Navigator.pop(context);
                  },
                ),
              ],
            ),
          );
        });
      },
      child: Container(
        decoration: BoxDecoration(
          color: Colors.pink,
          borderRadius: BorderRadius.circular(20),
        ),
        margin: EdgeInsets.only(top: 10),
        padding: EdgeInsets.all(10),
        child: Row(
          children: [
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    '${model.title}',
                    style: TextStyle(
                      fontSize: 20,
                    ),
                  ),
                  SizedBox(
                    height: 5,
                  ),
                  Row(
                    children: [
                      Icon(Icons.timelapse),
                      SizedBox(
                        width: 4,
                      ),
                      Text('${model.startTime}',
                          style: Theme.of(context).textTheme.subtitle2),
                      Text(' - '),
                      Text('${model.endTime}',
                          style: Theme.of(context).textTheme.subtitle2),
                    ],
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Text(
                    '${model.note}',
                    style: Theme.of(context).textTheme.subtitle2,
                  ),
                ],
              ),
            ),
            Container(
              width: 0.5,
              height: 60,
              color: Colors.white,
              margin: EdgeInsets.symmetric(horizontal: 5),
            ),
            RotatedBox(
              quarterTurns: 3,
              child: Text(
                'new',
                style: Theme.of(context).textTheme.subtitle2,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
