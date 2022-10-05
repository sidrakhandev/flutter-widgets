import 'package:flutter/material.dart';

void main() => runApp(const MyApp());

// This is the main application widget.
class MyApp extends StatelessWidget {
  const MyApp({Key key}) : super(key: key);
  static const String _title = 'Sort & Filter           Clear          Apply';

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: _title,
      home: Scaffold(
        appBar: AppBar(
          leading: Icon(Icons.close),
          title: Text(_title),
          backgroundColor: Colors.pink,
        ),
        body: SingleChildScrollView(
          child: MyStatefulWidget(),
        ),
      ),
    );
  }
}

// This is the stateful widget that the main application starts.
class MyStatefulWidget extends StatefulWidget {
  const MyStatefulWidget({Key key}) : super(key: key);

  @override
  _MyStatefulWidgetState createState() => _MyStatefulWidgetState();
}

// This is the private State class that goes with MyStatefulWidget.
class _MyStatefulWidgetState extends State<MyStatefulWidget> {
  String dropdownValue = 'Newest Fisrt';
  List<bool> isSelected = List.generate(2, (_) => false);
  List<bool> _isSelected = List.generate(3, (_) => false);
  List<bool> _valu = List.generate(3, (_) => false);

  TextEditingController dateCtl = TextEditingController();
  
  TextEditingController _dateCtl = TextEditingController();
  Map<String, bool> numbers = {
    'Sale': false,
    'Credit': false,
    'Refund': false,
    'Loan': false,
    'Direct Material': false,
    'Direct Labour': false,
    'Asset': false,
  };

  var gettingItems = [];

  getItems() {
    numbers.forEach((key, value) {
      if (value == true) {
        gettingItems.add(key);
      }
    });
    gettingItems.clear();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        Container(
          child: Padding(
            padding: const EdgeInsets.fromLTRB(0, 5, 348, 3),
            child: Text(
              'Sort By',
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 17),
            ),
          ),
        ),
        Padding(
          padding: const EdgeInsets.fromLTRB(0, 2, 265, 3),
          child: DropdownButton<String>(
            value: dropdownValue,
            style: const TextStyle(color: Colors.deepPurple, fontSize: 16),
            onChanged: (String newValue) {
              setState(() {
                dropdownValue = newValue;
              });
            },
            items: <String>[
              'Newest Fisrt',
              'Oldest First',
              'Value High-Low',
              'Value Low-High'
            ].map<DropdownMenuItem<String>>((String value) {
              return DropdownMenuItem<String>(
                value: value,
                child: Text(value),
              );
            }).toList(),
          ),
        ),
        Divider(),
        Container(
          child: Padding(
            padding: const EdgeInsets.fromLTRB(0, 2, 265, 10),
            child: Text(
              'Transaction Types',
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 17),
            ),
          ),
        ),
        Container(
          child: Padding(
            padding: const EdgeInsets.fromLTRB(0, 2, 100, 3),
            child: ToggleButtons(
              selectedColor: Colors.white,
              fillColor: Colors.teal[800],
              borderColor: Colors.black,
              borderWidth: 2,
              borderRadius: BorderRadius.all(
                Radius.circular(5.0),
              ),
              children: <Widget>[
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text(
                    'Money In',
                    style: TextStyle(
                      fontFamily: 'Source Sans Pro',
                      fontSize: 22,
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text(
                    'Money Out',
                    style: TextStyle(
                      fontFamily: 'Source Sans Pro',
                      fontSize: 20,
                    ),
                  ),
                ),
              ],
              onPressed: (int index) {
                setState(() {
                  for (int buttonIndex = 0;
                      buttonIndex < isSelected.length;
                      buttonIndex++) {
                    if (buttonIndex == index) {
                      isSelected[buttonIndex] = !isSelected[buttonIndex];
                    } else {
                      isSelected[buttonIndex] = false;
                    }
                  }
                });
              },
              isSelected: isSelected,
            ),
          ),
        ),
        Divider(),
        SizedBox(
          height: 200,
          child: ListView(
            children: numbers.keys.map((String key) {
              return new CheckboxListTile(
                title: new Text(key),
                value: numbers[key],
                activeColor: Colors.purple,
                checkColor: Colors.white,
                selected: numbers[key],
                onChanged: (bool value) {
                  setState(() {
                    numbers[key] = value;
                  });
                },
              );
            }).toList(),
          ),
        ),
        Divider(),
        Container(
          child: Container(
            child: Padding(
              padding: const EdgeInsets.fromLTRB(0, 2, 265, 10),
              child: Text(
                'Transaction Health',
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 17),
              ),
            ),
          ),
        ),
        Container(
          margin: EdgeInsets.all(10),
          child: Padding(
            padding: const EdgeInsets.fromLTRB(0, 2, 100, 3),
            child: ToggleButtons(
              selectedColor: Colors.white,
              fillColor: Colors.teal[800],
              borderColor: Colors.black,
              borderWidth: 2,
              borderRadius: BorderRadius.all(
                Radius.circular(5.0),
              ),
              children: <Widget>[
                Container(
                  child: Column(
                    children: <Widget>[
                      Icon(
                        Icons.thumb_up,
                        color: Colors.green,
                      ),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Text(
                          'Good',
                          style: TextStyle(
                            fontFamily: 'Source Sans Pro',
                            fontSize: 23,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                Container(
                  child: Column(
                    children: <Widget>[
                      Icon(
                        Icons.thumb_down,
                        color: Colors.orange,
                      ),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Text(
                          'Ok',
                          style: TextStyle(
                            fontFamily: 'Source Sans Pro',
                            fontSize: 23,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                Container(
                  child: Column(
                    children: <Widget>[
                      Icon(
                        Icons.thumb_down,
                        color: Colors.red,
                      ),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Text(
                          'Bad',
                          style: TextStyle(
                            fontFamily: 'Source Sans Pro',
                            fontSize: 23,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
              onPressed: (int index) {
                setState(() {
                  for (int buttonIndex = 0;
                      buttonIndex < _isSelected.length;
                      buttonIndex++) {
                    if (buttonIndex == index) {
                      _isSelected[buttonIndex] = !_isSelected[buttonIndex];
                    } else {
                      _isSelected[buttonIndex] = false;
                    }
                  }
                });
              },
              isSelected: _isSelected,
            ),
          ),
        ),
        Divider(),
        CheckboxListTile(
          title: const Text('Consultant Notes Only'),
          activeColor: Colors.purple,
          checkColor: Colors.white,
          selected: _valu[0],
          value: _valu[0],
          onChanged: (bool value) {
            setState(() {
              _valu[0] = value;
            });
          },
        ),
        CheckboxListTile(
          title: const Text('Overdue Only'),
          activeColor: Colors.purple,
          checkColor: Colors.white,
          selected: _valu[1],
          value: _valu[1],
          onChanged: (bool value) {
            setState(() {
              _valu[1] = value;
            });
          },
        ),
        CheckboxListTile(
          title: const Text('Date Range'),
          activeColor: Colors.purple,
          checkColor: Colors.white,
          selected: _valu[2],
          value: _valu[2],
          onChanged: (bool value) {
            setState(() {
              _valu[2] = value;
            });
          },
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: <Widget>[
            Flexible(
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: TextFormField(
                  controller: _dateCtl,
                  decoration: InputDecoration(
                    labelText: "From",
                  
                  ),
                  onTap: () async {
                    DateTime date = DateTime(1900);
                    FocusScope.of(context).requestFocus(new FocusNode());
                    date = await showDatePicker(
                        context: context,
                        initialDate: DateTime.now(),
                        firstDate: DateTime(1900),
                        lastDate: DateTime(2100));

                    _dateCtl.text = date.toString();
                  },
                ),
              ),
            ),
            Flexible(
              child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: TextFormField(
                      controller: dateCtl,
                      decoration: InputDecoration(
                        labelText: "To",
                      
                      ),
                      onTap: () async {
                        DateTime date = DateTime(1900);
                        FocusScope.of(context).requestFocus(new FocusNode());
                        date = await showDatePicker(
                            context: context,
                            initialDate: DateTime.now(),
                            firstDate: DateTime(1900),
                            lastDate: DateTime(2100));

                        dateCtl.text = date.toString();
                      },
                    ),
                  ),

            ),
          ],
        ),
      ],
    );
  }
}
