import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:split_bills/bootstrap.dart';
import 'package:split_bills/core/resource/additional_item.dart';
import 'package:split_bills/presentation/home/bloc/home_bloc.dart';
import 'package:split_bills/presentation/home/widget/additional_item.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => getIt<HomeBloc>()..add(const HomeInitialEvent()),
      child: Scaffold(
        body: BlocBuilder<HomeBloc, HomeState>(
          builder: (context, state) {
            final bloc = context.read<HomeBloc>();
            return CustomScrollView(
              slivers: [
                const SliverAppBar(
                  title: Text(
                    'Split Your Bills',
                  ),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.vertical(
                      bottom: Radius.circular(16),
                    ),
                  ),
                ),
                Form(
                  key: bloc.formKey,
                  child: SliverList(
                    delegate: SliverChildListDelegate([
                      TextFormField(
                        controller: bloc.billAmountController,
                        decoration: const InputDecoration(
                          labelText: 'Bill Amount',
                        ),
                      ),
                      TextFormField(
                        controller: bloc.numberOfPeopleController,
                        decoration: const InputDecoration(
                          labelText: 'Number of People',
                        ),
                      ),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Row(
                            children: [
                              const Text('Additional Items'),
                              IconButton(
                                onPressed: () {
                                  bloc.add(
                                    HomeAddItemEvent(
                                      AdditionalItem(
                                        name: '',
                                        price: 0,
                                      ),
                                    ),
                                  );
                                },
                                icon: const Icon(Icons.add),
                              ),
                            ],
                          ),
                          ListView.builder(
                            shrinkWrap: true,
                            itemCount: state.additionalItem.length,
                            itemBuilder: (context, index) {
                              final item = state.additionalItem[index];
                              return AdditionalItemWidget(
                                item: item,
                                onDelete: () {
                                  bloc.add(
                                    HomeDeleteItemEvent(index),
                                  );
                                },
                                onChanged: (item) {
                                  bloc.add(
                                    HomeUpdateItemEvent(index, item),
                                  );
                                },
                              );
                            },
                          ),
                        ],
                      ),
                      ElevatedButton(
                        onPressed: () {
                          bloc.add(const HomeSaveEvent());
                        },
                        child: const Text('Split Bill!'),
                      ),
                    ]),
                  ),
                ),
              ],
            );
          },
        ),
      ),
    );
  }
}
