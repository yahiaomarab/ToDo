import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';
import '../../data/models/task_model.dart';
import '../../view_model/task_cubit/task_cubit.dart';
import '../../view_model/task_cubit/task_states.dart';
import '../../widgets/themes/colors/HexColors.dart';
import '../../widgets/component/Reuse_Component.dart';
import '../layout_screen/layout_screen.dart';

class AddTaskScreen extends StatelessWidget {
  var formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (BuildContext context) => AddTaskCubit()..getAllTasks(),
      child:
          BlocConsumer<AddTaskCubit, AddTaskStates>(listener: (context, state) {
        if (state is InsertingDatabaseState) navTo(context, LayoutScreen());
      }, builder: (context, state) {
        AddTaskCubit cubit = AddTaskCubit.get(context);
        return Scaffold(
          appBar: appbar(
            onpressed: () {
              navTo(context, LayoutScreen());
            },
            iconLead: Icon(Icons.arrow_back_ios),
          ),
          body: SafeArea(
            child: Container(
              margin: EdgeInsets.only(top: 10),
              padding: EdgeInsets.symmetric(
                horizontal: 30,
              ),
              child: SingleChildScrollView(
                child: Center(
                  child: Form(
                    key: formKey,
                    child: Column(
                      children: [
                        Text(
                          'Add Task',
                          style: Theme.of(context).textTheme.bodyText2,
                        ),
                        SizedBox(
                          height: 15,
                        ),
                        textField(
                          text: 'Title',
                          hintText: 'write your title',
                          Controller: cubit.titleController,
                          type: TextInputType.text,
                          validate: (String? value) {
                            if (value!.isEmpty) return 'Title must be written';
                            return null;
                          },
                        ),
                        SizedBox(
                          height: 15,
                        ),
                        textField(
                          text: 'Note',
                          hintText: 'write your title',
                          Controller: cubit.noteController,
                          type: TextInputType.text,
                          validate: (String? value) {
                            if (value!.isEmpty) return 'Note must be written';
                            return null;
                          },
                        ),
                        SizedBox(
                          height: 15,
                        ),
                        textField(
                          text: 'Date',
                          hintText:
                              '${DateFormat.yMd().format(cubit.timeSelected)}',
                          Controller: cubit.dateController,
                          type: TextInputType.datetime,
                          validate: (String? value) {
                            if (value!.isEmpty) return 'date must be written';
                            return null;
                          },
                          suffixIcon: IconButton(
                            icon: Icon(Icons.calendar_month),
                            onPressed: () {
                              showDatePicker(
                                context: context,
                                initialDate: DateTime.now(),
                                firstDate: DateTime.now(),
                                lastDate: DateTime.parse('2023-05-03'),
                              ).then((value) {
                                cubit.dateController.text =
                                    DateFormat.yMMMd().format(value!);
                              });
                            },
                          ),
                        ),
                        SizedBox(
                          height: 15,
                        ),
                        Row(
                          children: [
                            textField(
                              formWidth: 165,
                              text: 'start-time',
                              hintText: '${cubit.startTime}',
                              Controller: cubit.startTimeController,
                              type: TextInputType.text,
                              validate: (String? value) {
                                if (value!.isEmpty)
                                  return 'StartTime must be written';
                                return null;
                              },
                              suffixIcon: IconButton(
                                icon: Icon(Icons.timelapse),
                                onPressed: () {
                                  showTimePicker(
                                    context: context,
                                    initialTime: TimeOfDay.now(),
                                  ).then((value) {
                                    cubit.startTimeController.text =
                                        value!.format(context).toString();
                                  });
                                },
                              ),
                            ),
                            Spacer(),
                            textField(
                              formWidth: 165,
                              text: 'end-time',
                              hintText: '${cubit.endTime}',
                              Controller: cubit.endTimeController,
                              type: TextInputType.text,
                              validate: (String? value) {
                                if (value!.isEmpty)
                                  return 'endTime must be written';
                                return null;
                              },
                              suffixIcon: IconButton(
                                icon: Icon(Icons.timelapse),
                                onPressed: () {
                                  showTimePicker(
                                    context: context,
                                    initialTime: TimeOfDay.now(),
                                  ).then((value) {
                                    cubit.endTimeController.text =
                                        value!.format(context).toString();
                                  });
                                },
                              ),
                            ),
                          ],
                        ),
                        SizedBox(
                          height: 15,
                        ),
                        textField(
                          text: 'Remind',
                          hintText: '${cubit.selectedRemind}',
                          Controller: cubit.remindController,
                          type: TextInputType.text,
                          validate: (String? value) {
                            if (value!.isEmpty) return 'Remind must be written';
                            return null;
                          },
                          suffixIcon: DropdownButton(
                            dropdownColor: darkHeaderClr,
                            items: cubit.remindList
                                .map<DropdownMenuItem<String>>(
                                  (e) => DropdownMenuItem<String>(
                                    value: e.toString(),
                                    child: Text(
                                      '$e',
                                      style: TextStyle(color: Colors.white),
                                    ),
                                  ),
                                )
                                .toList(),
                            onChanged: (String? newValue) {
                              cubit.changeRemindValue(newValue);
                            },
                            icon: Icon(
                              Icons.keyboard_arrow_down,
                            ),
                            underline: Container(
                              height: 0,
                            ),
                            iconSize: 32,
                          ),
                        ),
                        SizedBox(
                          height: 15,
                        ),
                        textField(
                          text: 'Repeat',
                          hintText: '${cubit.selectedRepeat}',
                          Controller: cubit.repeatController,
                          type: TextInputType.text,
                          validate: (String? value) {
                            if (value!.isEmpty) return 'Repeat must be written';
                            return null;
                          },
                          suffixIcon: DropdownButton(
                            dropdownColor: darkHeaderClr,
                            items: cubit.selectedRepeatedList
                                .map<DropdownMenuItem<String>>(
                                  (e) => DropdownMenuItem<String>(
                                    value: e,
                                    child: Text(
                                      '$e',
                                      style: TextStyle(color: Colors.white),
                                    ),
                                  ),
                                )
                                .toList(),
                            onChanged: (newValue) {
                              cubit.changeRepeatValue(newValue);
                            },
                            icon: Icon(
                              Icons.keyboard_arrow_down,
                            ),
                            underline: Container(
                              height: 0,
                            ),
                            iconSize: 32,
                          ),
                        ),
                        SizedBox(
                          height: 30,
                        ),
                        Row(
                          crossAxisAlignment: CrossAxisAlignment.end,
                          children: [
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  'Color',
                                  style: Theme.of(context).textTheme.subtitle2,
                                ),
                                SizedBox(
                                  height: 5,
                                ),
                                Wrap(
                                  children: List.generate(
                                    cubit.chosenIndex.length,
                                    (index) => GestureDetector(
                                      onTap: () {
                                        cubit.changeColorValue(index);
                                      },
                                      child: Padding(
                                        padding:
                                            const EdgeInsets.only(right: 8.0),
                                        child: Container(
                                          child: cubit.selectedColor == index
                                              ? Icon(
                                                  Icons.done,
                                                  color: Colors.white,
                                                  size: 20,
                                                )
                                              : null,
                                          height: 40,
                                          width: 40,
                                          decoration: BoxDecoration(
                                            color: cubit.colorList[index],
                                            borderRadius:
                                                BorderRadius.circular(20),
                                          ),
                                        ),
                                      ),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                            Spacer(),
                            Button(
                                label: 'Create',
                                onTap: () {
                                  if (formKey.currentState!.validate()) {
                                    cubit.insertAllTasks(
                                      TaskModel(
                                        remind: int.parse(
                                            cubit.remindController.text),
                                        title: cubit.titleController.text,
                                        note: cubit.noteController.text,
                                        startTime:
                                            cubit.startTimeController.text,
                                        endTime: cubit.endTimeController.text,
                                        date: cubit.dateController.text,
                                        repeat: cubit.repeatController.text,
                                      ),
                                    );
                                  }
                                }),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ),
          ),
        );
      }),
    );
  }
}
