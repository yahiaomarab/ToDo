import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../view_model/task_cubit/task_cubit.dart';
import '../../view_model/task_cubit/task_states.dart';
import '../../widgets/component/Reuse_Component.dart';

class SearchScreen extends StatelessWidget {
  var searchController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (BuildContext context) => AddTaskCubit()..getAllTasks(),
      child: BlocConsumer<AddTaskCubit, AddTaskStates>(
        listener: (context, state) {},
        builder: (context, state) {
          AddTaskCubit cubit = AddTaskCubit.get(context);
          return Scaffold(
            body: Padding(
              padding: const EdgeInsets.symmetric(
                vertical: 50,
                horizontal: 10,
              ),
              child: Column(
                children: [
                  TextFormField(
                    decoration: InputDecoration(
                      labelText: 'Search',
                      prefixIcon: Icon(Icons.search_outlined),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(40),
                      ),
                    ),
                    controller: searchController,
                    onChanged: (value) {
                      cubit.searchDatabase(value);
                    },
                  ),
                  Expanded(
                      child: ConditionalBuilder(
                    condition: cubit.tasks.length > 0,
                    builder: (context) => cubit.search.isNotEmpty
                        ? ListView.separated(
                            physics: BouncingScrollPhysics(),
                            itemBuilder: (context, index) => buildSearchItem(
                                  context,
                                  cubit.search[index],
                                ),
                            separatorBuilder: (context, index) => SizedBox(
                                  height: 20,
                                ),
                            itemCount: cubit.search.length)
                        : ListView.separated(
                            physics: BouncingScrollPhysics(),
                            itemBuilder: (context, index) => buildSearchItem(
                                  context,
                                  cubit.tasks[index],
                                ),
                            separatorBuilder: (context, index) => SizedBox(
                                  height: 20,
                                ),
                            itemCount: cubit.tasks.length),
                    fallback: (context) => Center(
                      child: Container(),
                    ),
                  )),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
