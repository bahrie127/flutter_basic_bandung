import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_basic/models/student.dart';
import 'package:intl/intl.dart';

class FormWidget extends StatefulWidget {
  const FormWidget({super.key});

  @override
  State<FormWidget> createState() => _FormWidgetState();
}

class _FormWidgetState extends State<FormWidget> {
  TextEditingController? usernameController;
  TextEditingController? tlController;
  String username = '';
  Student? selectedValue;
  Student? radioValue;
  bool isChecked = false;
  bool isConnect = false;

  DateTime? dateSelected;

  DateTime date = DateTime(2016, 10, 26);
  DateTime time = DateTime(2016, 5, 10, 22, 35);
  DateTime dateTime = DateTime(2016, 8, 3, 17, 45);

  // This function displays a CupertinoModalPopup with a reasonable fixed height
  // which hosts CupertinoDatePicker.
  void _showDialog(Widget child) {
    showCupertinoModalPopup<void>(
      context: context,
      builder: (BuildContext context) => Container(
        height: 216,
        padding: const EdgeInsets.only(top: 6.0),
        // The Bottom margin is provided to align the popup above the system
        // navigation bar.
        margin: EdgeInsets.only(
          bottom: MediaQuery.of(context).viewInsets.bottom,
        ),
        // Provide a background color for the popup.
        color: CupertinoColors.systemBackground.resolveFrom(context),
        // Use a SafeArea widget to avoid system overlaps.
        child: SafeArea(
          top: false,
          child: child,
        ),
      ),
    );
  }

  @override
  void initState() {
    usernameController = TextEditingController();
    tlController = TextEditingController();
    // selectedValue = students.first;
    radioValue = students.first;
    usernameController!.text = 'bahri';
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
    usernameController!.dispose();
    tlController!.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Form Widget')),
      body: ListView(
        padding: const EdgeInsets.symmetric(horizontal: 16),
        children: [
          TextField(
            controller: usernameController,
            maxLines: 1,
            obscureText: true,
            onChanged: (value) {
              username = value;
            },
            keyboardType: TextInputType.number,
            decoration: const InputDecoration(
              label: Text('Username'),
            ),
          ),
          const SizedBox(
            height: 16,
          ),
          DropdownButton<Student>(
              value: selectedValue,
              items: students
                  .map(
                    (e) => DropdownMenuItem<Student>(
                      value: e,
                      child: Text(
                        e.id.toString(),
                      ),
                    ),
                  )
                  .toList(),
              onChanged: (value) {
                selectedValue = value;
                setState(() {});
              }),
          const SizedBox(
            height: 16,
          ),
          Row(
            children: [
              const Text('Connect Instagram'),
              const SizedBox(
                width: 8,
              ),
              Switch(
                value: isConnect,
                onChanged: (value) {
                  setState(() {
                    isConnect = value;
                  });
                },
              ),
            ],
          ),
          const SizedBox(
            height: 16,
          ),
          Wrap(
            children: students
                .map(
                  (e) => Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Text(e.id.toString()),
                      Radio<Student>(
                          value: e,
                          groupValue: radioValue,
                          onChanged: (value) {
                            setState(() {
                              radioValue = value;
                            });
                          }),
                    ],
                  ),
                )
                .toList(),
          ),
          const SizedBox(
            height: 16,
          ),
          Row(
            children: [
              Checkbox(
                value: isChecked,
                onChanged: (value) {
                  if (value != null) {
                    isChecked = value;
                    setState(() {});
                  }
                },
              ),
              const SizedBox(
                width: 8,
              ),
              const Text(('Term & Conditions')),
            ],
          ),
          const SizedBox(
            height: 16,
          ),
          InkWell(
            onTap: () async {
              final selected = await showDatePicker(
                context: context,
                initialDate: dateSelected ?? DateTime.now(),
                firstDate: DateTime(1900),
                lastDate: DateTime(3000),
              );

              if (selected != null) {
                dateSelected = selected;
                tlController!.text =
                    DateFormat('dd-MMM-yyyy').format(dateSelected!);
                setState(() {});
              }
            },
            child: TextField(
              controller: tlController,
              decoration: InputDecoration(
                labelText: 'Tanggal Lahir',
              ),
              enabled: false,
            ),
          ),
          const SizedBox(
            height: 16,
          ),
          CupertinoButton(
            // Display a CupertinoDatePicker in date picker mode.
            onPressed: () => _showDialog(
              CupertinoDatePicker(
                initialDateTime: date,
                mode: CupertinoDatePickerMode.date,
                use24hFormat: true,
                // This shows day of week alongside day of month
                showDayOfWeek: true,
                // This is called when the user changes the date.
                onDateTimeChanged: (DateTime newDate) {
                  setState(() => date = newDate);
                },
              ),
            ),
            // In this example, the date is formatted manually. You can
            // use the intl package to format the value based on the
            // user's locale settings.
            child: Text(
              '${date.month}-${date.day}-${date.year}',
              style: const TextStyle(
                fontSize: 22.0,
              ),
            ),
          ),
          const SizedBox(
            height: 16,
          ),
          ElevatedButton(
            onPressed: () {
              showDialog(
                  context: context,
                  builder: (context) {
                    return SimpleDialog(
                      title: const Text('Info'),
                      children: [
                        Center(
                          child: Text(usernameController!.text),
                        ),
                        Center(
                          child: Text(selectedValue?.name ?? 'data kosong'),
                        ),
                        Center(
                          child: Text(isConnect ? 'Connect' : 'Not Connect'),
                        ),
                        Center(
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text(radioValue!.id.toString()),
                              Text(radioValue?.name ?? 'data kosong'),
                            ],
                          ),
                        ),
                        Center(
                          child: Text(isChecked ? 'T&C Yes' : 'T&C No'),
                        ),
                      ],
                    );
                  });
            },
            child: const Text('Submit'),
          ),
        ],
      ),
    );
  }
}
