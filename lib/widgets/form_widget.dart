import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_basic/models/student.dart';
import 'package:flutter_basic/widgets/grid_widget.dart';
import 'package:intl/intl.dart';

class FormWidget extends StatefulWidget {
  const FormWidget({super.key});

  @override
  State<FormWidget> createState() => _FormWidgetState();
}

class _FormWidgetState extends State<FormWidget> {
  TextEditingController? usernameController;

  String username = '';
  Student? selectedValue;
  Student? radioValue;
  bool isChecked = false;
  bool isConnect = false;

  TextEditingController? tlController;
  DateTime? dateSelected;

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
              decoration: const InputDecoration(
                // labelText: 'Tanggal Lahir',
                prefixText: 'Tanggal Lahir: ',
              ),
              enabled: false,
            ),
          ),
          const SizedBox(
            height: 16,
          ),
          const SizedBox(
            height: 16,
          ),
          ElevatedButton(
            onPressed: () {
              // showDialog(
              //     context: context,
              //     builder: (context) {
              //       return SimpleDialog(
              //         title: const Text('Info'),
              //         children: [
              //           Center(
              //             child: Text(usernameController!.text),
              //           ),
              //           Center(
              //             child: Text(selectedValue?.name ?? 'data kosong'),
              //           ),
              //           Center(
              //             child: Text(isConnect ? 'Connect' : 'Not Connect'),
              //           ),
              //           Center(
              //             child: Row(
              //               mainAxisAlignment: MainAxisAlignment.center,
              //               children: [
              //                 Text(radioValue!.id.toString()),
              //                 Text(radioValue?.name ?? 'data kosong'),
              //               ],
              //             ),
              //           ),
              //           Center(
              //             child: Text(isChecked ? 'T&C Yes' : 'T&C No'),
              //           ),
              //           Center(
              //             child: Text(
              //                 'Selected Date: ${DateFormat('dd-MMM-yyyy').format(dateSelected!)}'),
              //           ),
              //         ],
              //       );
              //     });

              showModalBottomSheet(
                  context: context,
                  builder: (context) {
                    return Container(
                      height: 300,
                      decoration: const BoxDecoration(
                        borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(20),
                          topRight: Radius.circular(20),
                        ),
                      ),
                      child: ListView(children: [
                        const Padding(
                          padding: EdgeInsets.symmetric(vertical: 16),
                          child: Text(
                            'Info',
                            textAlign: TextAlign.center,
                          ),
                        ),
                        const Divider(),
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
                        Center(
                          child: Text(
                              'Selected Date: ${DateFormat('dd-MMM-yyyy').format(dateSelected ?? DateTime.now())}'),
                        ),
                        const SizedBox(
                          height: 16,
                        ),
                        ElevatedButton(
                            onPressed: () async {
                              await Navigator.push(context, MaterialPageRoute(
                                builder: (context) {
                                  return const GridWidget(
                                    title: 'Latihan Route',
                                  );
                                },
                              ));

                              Navigator.pop(context);
                              ScaffoldMessenger.of(context).showSnackBar(
                                const SnackBar(
                                  content: Text('Back berhasil'),
                                  backgroundColor: Colors.blue,
                                ),
                              );
                            },
                            child: const Text('Next Page'))
                      ]),
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
