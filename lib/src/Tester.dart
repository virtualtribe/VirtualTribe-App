// import 'dart:math' as math;
// import 'package:intl/intl.dart';
// import 'package:flutter/foundation.dart';
// import 'package:flutter/material.dart';
// import 'package:virtualtribe/src/model.dart';
// import 'package:virtualtribe/src/sample_view.dart';
// import 'package:syncfusion_flutter_datagrid/datagrid.dart';
// import 'package:intl/intl.dart' as intl;

// class ColumnTypeDataGrid extends SampleView {
//   const ColumnTypeDataGrid({Key key}) : super(key: key);

//   @override
//   _ColumnTypesDataGridState createState() => _ColumnTypesDataGridState();
// }

// List<Employee> _employeeData;

// class _ColumnTypesDataGridState extends SampleViewState {
//   _ColumnTypesDataGridState();

//   Widget sampleWidget(SampleModel model) => const ColumnTypeDataGrid();

//   final math.Random _random = math.Random();

//   final ColumnTypesDataGridSource _columnTypesDataGridSource =
//       ColumnTypesDataGridSource();

//   List<Employee> generateList(int count) {
//     final List<Employee> employeeData = <Employee>[];
//     for (int i = 0; i < count; i++) {
//       employeeData.add(Employee(
//         1100 + i,
//         _names[i < _names.length ? i : _random.nextInt(_names.length - 1)],
//         _dealers[
//             i < _dealers.length ? i : _random.nextInt(_dealers.length - 1)],
//         _random.nextInt(1000) + _random.nextDouble(),
//         _shippedDates[_random.nextInt(_shippedDates.length - 1)],
//         _citys[_random.nextInt(_citys.length - 1)],
//         1500.0 + _random.nextInt(100),
//       ));
//     }
//     return employeeData;
//   }

//   final List<Image> _dealers = <Image>[
//     Image.asset('images/People_Circle2.png'),
//     Image.asset('images/People_Circle18.png'),
//     Image.asset('images/People_Circle3.png'),
//     Image.asset('images/People_Circle4.png'),
//     Image.asset('images/People_Circle7.png'),
//     Image.asset('images/People_Circle23.png'),
//     Image.asset('images/People_Circle6.png'),
//     Image.asset('images/People_Circle8.png'),
//     Image.asset('images/People_Circle9.png'),
//     Image.asset('images/People_Circle10.png'),
//     Image.asset('images/People_Circle11.png'),
//     Image.asset('images/People_Circle13.png'),
//     Image.asset('images/People_Circle14.png'),
//     Image.asset('images/People_Circle15.png'),
//     Image.asset('images/People_Circle16.png'),
//     Image.asset('images/People_Circle17.png'),
//     Image.asset('images/People_Circle19.png'),
//     Image.asset('images/People_Circle20.png'),
//     Image.asset('images/People_Circle21.png'),
//     Image.asset('images/People_Circle22.png'),
//     Image.asset('images/People_Circle23.png'),
//     Image.asset('images/People_Circle24.png'),
//     Image.asset('images/People_Circle25.png'),
//     Image.asset('images/People_Circle26.png'),
//     Image.asset('images/People_Circle27.png'),
//   ];

//   final List<String> _names = <String>[
//     'Betts',
//     'Adams',
//     'Crowley',
//     'Stark',
//     'Keefe',
//     'Doran',
//     'Newberry',
//     'Blanc',
//     'Gable',
//     'Balnc',
//     'Perry',
//     'Lane',
//     'Grimes'
//   ];

//   final List<DateTime> _shippedDates = <DateTime>[
//     DateTime.now(),
//     DateTime(2002, 8, 27),
//     DateTime(2015, 7, 4),
//     DateTime(2007, 4, 15),
//     DateTime(2010, 12, 23),
//     DateTime(2010, 4, 20),
//     DateTime(2004, 6, 13),
//     DateTime(2008, 11, 11),
//     DateTime(2005, 7, 29),
//     DateTime(2009, 4, 5),
//     DateTime(2003, 3, 20),
//     DateTime(2011, 3, 8),
//     DateTime(2013, 10, 22),
//   ];

//   final List<String> _citys = <String>[
//     'Graz',
//     'Bruxelles',
//     'Rosario',
//     'Recife',
//     'Campinas',
//     'Montreal',
//     'Tsawassen',
//     'Resende',
//   ];

//   SfDataGrid getDataGrid() {
//     return SfDataGrid(
//         source: _columnTypesDataGridSource,
//         columnWidthMode: kIsWeb ? ColumnWidthMode.fill : ColumnWidthMode.auto,
//         cellBuilder: (BuildContext context, GridColumn column, int rowIndex) {
//           return Container(
//             padding: const EdgeInsets.all(3),
//             child: _employeeData[rowIndex].dealer,
//           );
//         },
//         columns: <GridColumn>[
//           GridWidgetColumn(mappingName: 'dealer')
//             ..width = 90
//             ..headerText = 'Dealer',
//           GridNumericColumn(mappingName: 'id')
//             ..headerText = ' ID'
//             ..headerTextAlignment = Alignment.centerRight,
//           GridTextColumn(mappingName: 'name')
//             ..headerText = 'Name'
//             ..headerTextAlignment = Alignment.centerLeft,
//           GridNumericColumn(mappingName: 'freight')
//             ..textAlignment = Alignment.center
//             ..headerTextAlignment = Alignment.center
//             ..numberFormat =
//                 NumberFormat.currency(locale: 'en_US', symbol: '\$')
//             ..headerText = 'Freight',
//           GridDateTimeColumn(mappingName: 'shippedDate')
//             ..columnWidthMode = ColumnWidthMode.header
//             ..headerText = 'Shipped Date'
//             ..dateFormat = intl.DateFormat.yMd(),
//           GridTextColumn(mappingName: 'city')
//             ..headerText = 'City'
//             ..headerTextAlignment = Alignment.centerLeft,
//           GridNumericColumn(mappingName: 'price')
//             ..headerTextAlignment = Alignment.centerRight
//             ..numberFormat =
//                 NumberFormat.currency(locale: 'en_US', symbol: '\$')
//             ..columnWidthMode = ColumnWidthMode.lastColumnFill
//             ..headerText = 'Price'
//         ]);
//   }

//   @override
//   void initState() {
//     super.initState();
//     _employeeData = generateList(100);
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(body: getDataGrid());
//   }
// }

// class Employee {
//   Employee(
//     this.id,
//     this.name,
//     this.dealer,
//     this.freight,
//     this.shippedDate,
//     this.city,
//     this.price,
//   );
//   final int id;
//   final String name;
//   final double price;
//   final DateTime shippedDate;
//   final Image dealer;
//   final double freight;
//   final String city;
// }

// class ColumnTypesDataGridSource extends DataGridSource {
//   ColumnTypesDataGridSource();
//   @override
//   List<Object> get dataSource => _employeeData;
//   @override
//   Object getCellValue(int rowIndex, String columnName) {
//     switch (columnName) {
//       case 'id':
//         return _employeeData[rowIndex].id;
//         break;
//       case 'name':
//         return _employeeData[rowIndex].name;
//         break;
//       case 'shippedDate':
//         return _employeeData[rowIndex].shippedDate;
//         break;
//       case 'freight':
//         return _employeeData[rowIndex].freight;
//         break;
//       case 'city':
//         return _employeeData[rowIndex].city;
//         break;
//       case 'price':
//         return _employeeData[rowIndex].price;
//         break;
//       default:
//         return 'empty';
//         break;
//     }
//   }
// }
