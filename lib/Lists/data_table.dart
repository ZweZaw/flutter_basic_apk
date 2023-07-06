import 'package:flutter/material.dart';
class DataTableExample extends StatefulWidget {
  const DataTableExample({Key? key}) : super(key: key);

  @override
  State<DataTableExample> createState() => _DataTableExampleState();
}
// Define Table
const kTableColumns = <DataColumn>[
  DataColumn(label: Text("Student Name")),
  DataColumn(label: Text("Age"),numeric: true, tooltip: "Student's age"),
  DataColumn(label: Text("Subject"), tooltip: "Student's Subject"),
  DataColumn(label: Text("Email"),tooltip: "Student's Mail"),
];

//Data Class
class Student{
  final String name;
  final int age;
  final String subject;
  final String mail;
  bool selected = false;
  Student(this.name, this.age, this.subject, this.mail);
}
// Data source class for obtaining row data for paginatedDataTable
class StudentDataSource extends DataTableSource{
  int _selectedCount= 0;
  final List<Student> _students= <Student>[
    Student("Student1", 11, "Subject 1", "mail1@gmail.com"),
    Student("Student2", 11, "Subject 1", "mail1@gmail.com"),
    Student("Student3", 11, "Subject 1", "mail1@gmail.com"),
    Student("Student4", 11, "Subject 1", "mail1@gmail.com"),
    Student("Student5", 11, "Subject 1", "mail1@gmail.com"),
    Student("Student6", 11, "Subject 1", "mail1@gmail.com"),
    Student("Student7", 11, "Subject 1", "mail1@gmail.com"),
    Student("Student8", 11, "Subject 1", "mail1@gmail.com"),
    Student("Student9", 11, "Subject 1", "mail1@gmail.com"),
    Student("Student10", 11, "Subject 1", "mail1@gmail.com"),
    Student("Student11", 11, "Subject 1", "mail1@gmail.com"),
    Student("Student12", 11, "Subject 1", "mail1@gmail.com"),

  ];

  @override
  DataRow? getRow(int index) {
    // TODO: implement getRow
    assert(index >= 0);
    if(index >= _students.length) return null;
    final Student currentStudent = _students[index];
    return DataRow.byIndex(
        index: index,
        selected: currentStudent.selected,
        onSelectChanged: (bool? value){
          if(value == null){
            return;
          }
          if(currentStudent.selected != value){
            _selectedCount += value? 1 : -1;
            assert(_selectedCount >= 0);
            currentStudent.selected = value;
            notifyListeners();
          }
        },
        cells: <DataCell>[
          DataCell(Text(currentStudent.name)),
          DataCell(Text(currentStudent.age.toString())),
          DataCell(Text(currentStudent.subject)),
          DataCell(Text(currentStudent.mail)),
        ]
    );
  }

  @override
  // TODO: implement isRowCountApproximate
  bool get isRowCountApproximate => false;

  @override
  // TODO: implement rowCount
  int get rowCount =>  _students.length;

  @override
  // TODO: implement selectedRowCount
  int get selectedRowCount => _selectedCount;
}

class _DataTableExampleState extends State<DataTableExample> {
  int _rowPerPage = PaginatedDataTable.defaultRowsPerPage;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: PaginatedDataTable(
          header: const Text("Student Information"),
          rowsPerPage: _rowPerPage,
          availableRowsPerPage: const <int> [5,10,15,20],
          onRowsPerPageChanged: (int? value){
            if(value!= null){
              setState(() {
                _rowPerPage = value;
              });
            }
          },
          columns: kTableColumns,
          source: StudentDataSource(),
        ),
      ),
    );
  }
}
