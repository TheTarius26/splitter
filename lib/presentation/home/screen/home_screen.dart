import 'package:flutter/material.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final _formKey = GlobalKey<FormState>();

  final _billAmountController = TextEditingController();
  final _numberOfPeopleController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomScrollView(
        slivers: [
          const SliverAppBar(
            title: Text(
              'Split Your Bills',
            ),
          ),
          Form(
            key: _formKey,
            child: SliverList(
              delegate: SliverChildListDelegate([
                TextFormField(
                  controller: _billAmountController,
                  decoration: const InputDecoration(
                    labelText: 'Bill Amount',
                  ),
                ),
                TextFormField(
                  controller: _numberOfPeopleController,
                  decoration: const InputDecoration(
                    labelText: 'Number of People',
                  ),
                ),
                ListView.builder(
                  shrinkWrap: true,
                  itemCount: 2,
                  itemBuilder: (context, index) {
                    return TextFormField(
                      decoration: const InputDecoration(
                        labelText: 'Additional Item',
                      ),
                    );
                  },
                ),
                ElevatedButton(
                  onPressed: () {},
                  child: const Text('Split'),
                ),
              ]),
            ),
          ),
        ],
      ),
    );
  }
}
