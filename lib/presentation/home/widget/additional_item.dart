import 'package:flutter/material.dart';
import 'package:split_bills/core/resource/additional_item.dart';

class AdditionalItemWidget extends StatefulWidget {
  const AdditionalItemWidget({
    required this.item,
    required this.onDelete,
    required this.onChanged,
    super.key,
  });

  final AdditionalItem item;
  final VoidCallback onDelete;
  final void Function(AdditionalItem item) onChanged;

  @override
  State<AdditionalItemWidget> createState() => _AdditionalItemWidgetState();
}

class _AdditionalItemWidgetState extends State<AdditionalItemWidget> {
  final item = AdditionalItem(name: '', price: 0);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        TextFormField(
          decoration: const InputDecoration(
            labelText: 'Name',
          ),
          initialValue: widget.item.name,
          onChanged: (value) {
            item.name = value;
            widget.onChanged(item);
          },
        ),
        TextFormField(
          decoration: const InputDecoration(
            labelText: 'Price',
          ),
          initialValue: widget.item.price.toString(),
          onChanged: (value) {
            item.price = double.parse(value);
            widget.onChanged(item);
          },
        ),
        IconButton(
          icon: const Icon(Icons.delete),
          onPressed: widget.onDelete,
        ),
      ],
    );
  }
}
