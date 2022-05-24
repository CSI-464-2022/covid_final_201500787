import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:covid_final/widgets/widgets.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class Reports extends StatefulWidget {
  const Reports({Key? key}) : super(key: key);

  @override
  State<Reports> createState() => _ReportsState();
}

class _ReportsState extends State<Reports> {
  TextEditingController textarea = TextEditingController();
  String? _report;
  TimeOfDay _time = TimeOfDay(hour: 7, minute: 15);
  DateTime _date = DateTime(2020, 11, 17);

  void _selectDate() async {
    final DateTime? newDate = await showDatePicker(
      context: context,
      initialDate: _date,
      firstDate: DateTime(2017, 1),
      lastDate: DateTime(2022, 7),
      helpText: 'Select a date',
    );
    if (newDate != null) {
      setState(() {
        _date = newDate;
      });
    }
  }

  void _selectTime() async {
    final TimeOfDay? newTime = await showTimePicker(
      context: context,
      initialTime: _time,
    );
    if (newTime != null) {
      setState(() {
        _time = newTime;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: const Color.fromARGB(255, 136, 179, 87),
        appBar: AppBar(
          title: const Text("REPORTS"),
          backgroundColor: Colors.blueGrey,
        ),
        body: Container(
          decoration: const BoxDecoration(
            image: DecorationImage(
                image: AssetImage('lib/assets/wall.jfif'),
                //fit: BoxFit.cover
                fit: BoxFit.cover),
          ),
          alignment: Alignment.center,
          padding: EdgeInsets.all(20),
          child: SingleChildScrollView(
            child: Column(
              children: [
                const SizedBox(
                  height: 70.0,
                  child: CircleAvatar(
                    backgroundColor: Colors.transparent,
                    radius: 60.0,
                    backgroundImage: AssetImage('lib/assets/LOGO.png'),
                  ),
                ),
                const SizedBox(
                  height: 20.0,
                  child: Text(
                    'COVID SAFE',
                    style: TextStyle(
                        color: Colors.black87,
                        fontSize: 22,
                        fontWeight: FontWeight.bold),
                  ),
                ),
                const SizedBox(
                  height: 10.0,
                ),
                DropdownButton<String>(
                  value: _report,
                  icon: const Icon(Icons.arrow_downward),
                  elevation: 16,
                  style: const TextStyle(
                      color: Colors.black87,
                      fontSize: 20,
                      fontWeight: FontWeight.bold),
                  underline: Container(
                    height: 5,
                    color: Colors.blueGrey,
                  ),
                  items: <String>['Mistreatment', 'Covid case']
                      .map<DropdownMenuItem<String>>((String value) {
                    return DropdownMenuItem<String>(
                      value: value,
                      child: Text(value),
                    );
                  }).toList(),
                  hint: const Text(
                    "Select report type: ",
                    style: TextStyle(
                        color: Colors.black87,
                        fontSize: 20,
                        fontWeight: FontWeight.bold),
                  ),
                  onChanged: (newValue) {
                    setState(() {
                      _report = newValue;
                    });
                  },
                ),
                const SizedBox(
                  height: 30,
                ),
                //SizedBox(
                //child:
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    const Text(
                      'Pick a date and time: ',
                      style: TextStyle(
                          color: Colors.black,
                          fontSize: 14,
                          fontWeight: FontWeight.bold),
                    ),
                    ElevatedButton(
                        onPressed: _selectDate,
                        child:
                            Text('${_date.day}/${_date.month}/${_date.year}')),
                    const SizedBox(
                      width: 10,
                    ),
                    ElevatedButton(
                        onPressed: _selectTime,
                        child: Text('${_time.hour}:${_time.minute}'))
                  ],
                ),
                const SizedBox(
                  height: 40,
                ),
                //),
                TextField(
                  controller: textarea,
                  keyboardType: TextInputType.multiline,
                  maxLines: 7,
                  decoration: const InputDecoration(
                      hintText: "Enter Report",
                      focusedBorder: OutlineInputBorder(
                          borderSide:
                              BorderSide(width: 1, color: Colors.black))),
                ),
                const SizedBox(
                  height: 10.0,
                ),
                ElevatedButton(
                    onPressed: () {
                      //if (_formKey.currentState!.validate()) {
                      Get.snackbar(
                        "Sending Report: $_report",
                        "Date: ${_date.day}/${_date.month}/${_date.year}\nTime: ${_time.hour}:${_time.minute}",
                        snackPosition: SnackPosition.BOTTOM,
                        duration: const Duration(seconds: 5),
                      );

                      DocumentReference report = FirebaseFirestore.instance
                          .collection('reports')
                          .doc();
                      report
                          .set({
                            'type': _report,
                            'date': '${_date.day}/${_date.month}/${_date.year}',
                            'time': '${_time.hour}:${_time.minute}',
                            'report': textarea.text,
                            'reportId': report.id
                          })
                          .then((value) => Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: ((context) => const Navigation()))))
                          .catchError((error) =>
                              print('Failed to send report: $error'));
                      //}
                    },
                    child: const Text("Send Report"))
              ],
            ),
          ),
        ));
  }
}
