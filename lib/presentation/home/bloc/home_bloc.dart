import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:injectable/injectable.dart';
import 'package:split_bills/core/resource/additional_item.dart';

part 'home_event.dart';
part 'home_state.dart';

@singleton
class HomeBloc extends Bloc<HomeEvent, HomeState> {
  HomeBloc() : super(HomeInitial()) {
    on<HomeInitialEvent>(_onInitial);
    on<HomeAddItemEvent>(_onAddItem);
    on<HomeDeleteItemEvent>(_onDeleteItem);
    on<HomeUpdateItemEvent>(_onUpdateItem);
    on<HomeSaveEvent>(_onSave);
  }

  final formKey = GlobalKey<FormState>();

  final billAmountController = TextEditingController();
  final numberOfPeopleController = TextEditingController();

  FutureOr<void> _onInitial(HomeInitialEvent event, Emitter<HomeState> emit) {
    emit(HomeInitial());
  }

  FutureOr<void> _onAddItem(HomeAddItemEvent event, Emitter<HomeState> emit) {
    emit(
      HomeLoaded(
        additionalItem: [
          ...state.additionalItem,
          AdditionalItem(name: '', price: 0),
        ],
      ),
    );
  }

  FutureOr<void> _onDeleteItem(
    HomeDeleteItemEvent event,
    Emitter<HomeState> emit,
  ) {
    emit(
      HomeLoaded(
        additionalItem: [
          ...state.additionalItem..removeAt(event.index),
        ],
      ),
    );
  }

  FutureOr<void> _onUpdateItem(
    HomeUpdateItemEvent event,
    Emitter<HomeState> emit,
  ) {
    final additionalItem = state.additionalItem;
    additionalItem[event.index] = event.item;
    emit(
      HomeLoaded(
        additionalItem: additionalItem,
      ),
    );
  }

  FutureOr<void> _onSave(HomeSaveEvent event, Emitter<HomeState> emit) {
    if (formKey.currentState!.validate()) {
      final billAmount = double.parse(billAmountController.text);
      final numberOfPeople = int.parse(numberOfPeopleController.text);
      final additionalItem = state.additionalItem;
      final totalAdditionalItem = additionalItem.fold<double>(
        0,
        (previousValue, element) => previousValue + element.price,
      );
      final totalBill = billAmount + totalAdditionalItem;
      final totalPerPerson = totalBill / numberOfPeople;
      emit(
        HomeSaved(
          total: totalBill,
          totalPerPerson: totalPerPerson,
        ),
      );
    }
  }
}
