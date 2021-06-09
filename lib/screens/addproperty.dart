import 'dart:io';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:farmland/config/formconst.dart';

class AddProperty extends StatefulWidget {
  const AddProperty({Key key}) : super(key: key);

  @override
  _AddPropertyState createState() => _AddPropertyState();
}

class _AddPropertyState extends State<AddProperty> {
  final networkHandler = NetworkHandler();
  List<File> _images = [];
  File _image;

  Future<void> _pickImage(ImageSource source) async {
    File selected = await ImagePicker.pickImage(source: source);
    setState(() {
      try {
        _images.add(selected);
      } catch (e) {
        print(e);
      }
    });
  }

  bool circular = false;
  PickedFile _imageFile;
  final _globalkey = GlobalKey<FormState>();
  // DropdownMenuItem _menu = DropdownMenuItem();
  TextEditingController _address = TextEditingController();
  TextEditingController _city = TextEditingController();
  //TextEditingController _age = TextEditingController();
  TextEditingController _pin = TextEditingController();
  TextEditingController _area = TextEditingController();
  TextEditingController _price = TextEditingController();
  TextEditingController _about = TextEditingController();
  final ImagePicker _picker = ImagePicker();
  List<String> _locations = ['Sell', 'Rent', 'Batai']; // Option 2
  String _selectedLocation;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Form(
        key: _globalkey,
        child: ListView(
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 30),
          children: <Widget>[
            Text(
              'Add Advertise',
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 40,
              ),
            ),
            SizedBox(
              height: 20,
            ),
            DropdownButton(
              isExpanded: true,
              hint: Text(
                'Please select Category',
                style: TextStyle(fontSize: 20),
              ), // Not necessary for Option 1
              value: _selectedLocation,
              onChanged: (newValue) {
                setState(() {
                  _selectedLocation = newValue;
                });
              },
              items: _locations.map((location) {
                return DropdownMenuItem(
                  child: new Text(location),
                  value: location,
                );
              }).toList(),
            ),
            //  imageProfile(),
            SizedBox(
              height: 15,
            ),
            addressTextField(),
            SizedBox(
              height: 15,
            ),
            cityTextField(),
            SizedBox(
              height: 15,
            ),
            // dobField(),
            // SizedBox(
            //   height: 20,
            // ),
            pinTextField(),
            SizedBox(
              height: 15,
            ),
            priceTextField(),
            SizedBox(
              height: 15,
            ),
            areaTextField(),
            SizedBox(
              height: 15,
            ),
            aboutTextField(),
            SizedBox(
              height: 15,
            ),

            _images.length == 0
                ? Container(
                    width: double.infinity,
                    height: 200.0,
                    margin: EdgeInsets.only(bottom: 20.0),
                    decoration: BoxDecoration(
                        border: Border.all(color: Colors.grey[400])),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        Text('No image selected.'),
                        FlatButton(
                          color: Colors.black,
                          onPressed: () async =>
                              _pickImage(ImageSource.gallery),
                          child: Text(
                            "Add New Photos",
                            style: TextStyle(color: Colors.white),
                          ),
                        ),
                      ],
                    ),
                  )
                : Column(
                    children: <Widget>[
                      Container(
                        padding: EdgeInsets.all(20.0),
                        child: FlatButton(
                          color: Colors.black,
                          onPressed: () async =>
                              _pickImage(ImageSource.gallery),
                          child: Text(
                            "Add New Photos",
                            style: TextStyle(color: Colors.white),
                          ),
                        ),
                      ),
                      Stack(
                        children: <Widget>[
                          Container(
                            height: 180.0,
                            child: ListView.builder(
                              scrollDirection: Axis.horizontal,
                              padding: EdgeInsets.all(10.0),
                              itemCount: _images.length,
                              itemBuilder: (BuildContext context, int index) {
                                return Stack(
                                  children: <Widget>[
                                    Image.file(
                                      _images[index],
                                    ),
                                    Container(
                                      width: 180.0,
                                      height: 50.0,
                                      color: Colors.black45,
                                    ),
                                    Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceAround,
                                      children: <Widget>[
                                        SizedBox(
                                          width: 10.0,
                                        ),
                                        index == 0
                                            ? Text(
                                                "Main Photo",
                                                style: TextStyle(
                                                    color: Colors.white,
                                                    fontWeight:
                                                        FontWeight.w600),
                                              )
                                            : Text(""),
                                        SizedBox(
                                          width: 30.0,
                                        ),
                                        IconButton(
                                          icon: Icon(
                                            Icons.cancel,
                                            color: Colors.white70,
                                          ),
                                          onPressed: () => setState(() {
                                            _images.removeAt(index);
                                          }),
                                        ),
                                      ],
                                    )
                                  ],
                                );
                              },
                            ),
                          ),
                          Positioned(
                              right: 0.0,
                              top: 30.0,
                              child: IconButton(
                                  icon: Icon(
                                    Icons.arrow_right,
                                    color: Colors.black,
                                    size: 80.0,
                                  ),
                                  onPressed: null)),
                        ],
                      ),
                    ],
                  ),

            InkWell(
              onTap: () async {
                setState(() {
                  circular = true;
                });
                if (_globalkey.currentState.validate()) {
                  Map<String, String> data = {
                    // "menu" : _menu.text;
                    "address": _address.text,
                    "profession": _city.text,
                    "pin": _pin.text,
                    "price": _price.text,
                    "area": _area.text,
                    "about": _about.text,
                  };
                  var response =
                      await networkHandler.post("/profile/add", data);
                  if (response.statusCode == 200 ||
                      response.statusCode == 201) {
                    if (_imageFile.path != null) {
                      var imageResponse = await networkHandler.patchImage(
                          "/profile/add/image", _imageFile.path);
                      if (imageResponse.statusCode == 200) {
                        setState(() {
                          circular = false;
                        });
                        Navigator.of(context).pushAndRemoveUntil(
                            MaterialPageRoute(builder: (context) => Scaffold()),
                            (route) => false);
                      }
                    } else {
                      setState(() {
                        circular = false;
                      });
                      Navigator.of(context).pushAndRemoveUntil(
                          MaterialPageRoute(builder: (context) => Scaffold()),
                          (route) => false);
                    }
                  }
                }
              },
              child: Center(
                child: Container(
                  width: 200,
                  height: 50,
                  decoration: BoxDecoration(
                    color: Colors.teal,
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: Center(
                    child: circular
                        ? CircularProgressIndicator()
                        : Text(
                            "Submit",
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 18,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget imageProfile() {
    return Center(
      child: Stack(children: <Widget>[
        CircleAvatar(
          radius: 80.0,
          backgroundImage: _imageFile == null
              ? AssetImage("assets/profile.jpeg")
              : FileImage(File(_imageFile.path)),
        ),
        Positioned(
          bottom: 20.0,
          right: 20.0,
          child: InkWell(
            onTap: () {
              showModalBottomSheet(
                context: context,
                builder: ((builder) => bottomSheet()),
              );
            },
            child: Icon(
              Icons.camera_alt,
              color: Colors.teal,
              size: 28.0,
            ),
          ),
        ),
      ]),
    );
  }

  Widget bottomSheet() {
    return Container(
      height: 100.0,
      width: MediaQuery.of(context).size.width,
      margin: EdgeInsets.symmetric(
        horizontal: 20,
        vertical: 20,
      ),
      child: Column(
        children: <Widget>[
          Text(
            "Choose Profile photo",
            style: TextStyle(
              fontSize: 20.0,
            ),
          ),
          SizedBox(
            height: 20,
          ),
          Row(mainAxisAlignment: MainAxisAlignment.center, children: <Widget>[
            FlatButton.icon(
              icon: Icon(Icons.camera),
              onPressed: () {
                takePhoto(ImageSource.camera);
              },
              label: Text("Camera"),
            ),
            FlatButton.icon(
              icon: Icon(Icons.image),
              onPressed: () {
                takePhoto(ImageSource.gallery);
              },
              label: Text("Gallery"),
            ),
          ])
        ],
      ),
    );
  }

  void takePhoto(ImageSource source) async {
    final pickedFile = await _picker.getImage(
      source: source,
    );
    setState(() {
      _imageFile = pickedFile;
    });
  }

  Widget addressTextField() {
    return TextFormField(
      controller: _address,
      validator: (value) {
        if (value.isEmpty) return "Address can't be empty";

        return null;
      },
      decoration: InputDecoration(
        border: OutlineInputBorder(
            borderSide: BorderSide(
          color: Colors.teal,
        )),
        focusedBorder: OutlineInputBorder(
            borderSide: BorderSide(
          color: Colors.orange,
          width: 2,
        )),
        prefixIcon: Icon(
          Icons.location_on_sharp,
          color: Colors.teal,
        ),
        labelText: "Address",
        helperText: "Address can't be empty",
        //  hintText: "Dev Stack",
      ),
    );
  }

  Widget cityTextField() {
    return TextFormField(
      controller: _city,
      validator: (value) {
        if (value.isEmpty) return "City can't be empty";

        return null;
      },
      decoration: InputDecoration(
        border: OutlineInputBorder(
            borderSide: BorderSide(
          color: Colors.teal,
        )),
        focusedBorder: OutlineInputBorder(
            borderSide: BorderSide(
          color: Colors.orange,
          width: 2,
        )),
        prefixIcon: Icon(
          Icons.location_city_outlined,
          color: Colors.teal,
        ),
        labelText: "City",
        helperText: "City can't be empty",
        // hintText: "Full Stack Developer",
      ),
    );
  }

  // Widget dobField() {
  //   return TextFormField(
  //     controller: _dob,
  //     validator: (value) {
  //       if (value.isEmpty) return "DOB can't be empty";
  //
  //       return null;
  //     },
  //     decoration: InputDecoration(
  //       border: OutlineInputBorder(
  //           borderSide: BorderSide(
  //         color: Colors.teal,
  //       )),
  //       focusedBorder: OutlineInputBorder(
  //           borderSide: BorderSide(
  //         color: Colors.orange,
  //         width: 2,
  //       )),
  //       prefixIcon: Icon(
  //         Icons.person,
  //         color: Colors.green,
  //       ),
  //       labelText: "Date Of Birth",
  //       helperText: "Provide DOB on dd/mm/yyyy",
  //       hintText: "01/01/2020",
  //     ),
  //   );
  // }

  Widget pinTextField() {
    return TextFormField(
      controller: _pin,
      // validator: (value) {
      //   if (value.isEmpty) return "Title can't be empty";
      //
      //   return null;
      // },
      decoration: InputDecoration(
        border: OutlineInputBorder(
            borderSide: BorderSide(
          color: Colors.teal,
        )),
        focusedBorder: OutlineInputBorder(
            borderSide: BorderSide(
          color: Colors.orange,
          width: 2,
        )),
        prefixIcon: Icon(
          Icons.pin_drop_sharp,
          color: Colors.teal,
        ),
        labelText: "Pin Code",
        // helperText: "It can't be empty",
        // hintText: "Flutter Developer",
      ),
    );
  }

  Widget areaTextField() {
    return TextFormField(
      controller: _area,
      validator: (value) {
        if (value.isEmpty) return "Area can't be empty";

        return null;
      },
      decoration: InputDecoration(
        border: OutlineInputBorder(
            borderSide: BorderSide(
          color: Colors.teal,
        )),
        focusedBorder: OutlineInputBorder(
            borderSide: BorderSide(
          color: Colors.orange,
          width: 2,
        )),
        // prefixIcon: Icon(
        //   Icons.a,
        //   color: Colors.teal,
        // ),
        labelText: "Area in acres",
        helperText: "Area can't be empty",
        //  hintText: "Dev Stack",
      ),
    );
  }

  Widget priceTextField() {
    return TextFormField(
      controller: _price,
      validator: (value) {
        if (value.isEmpty) return "Price can't be empty";

        return null;
      },
      decoration: InputDecoration(
        border: OutlineInputBorder(
            borderSide: BorderSide(
          color: Colors.teal,
        )),
        focusedBorder: OutlineInputBorder(
            borderSide: BorderSide(
          color: Colors.orange,
          width: 2,
        )),
        prefixIcon: Icon(
          Icons.filter_vintage_sharp,
          color: Colors.teal,
        ),
        labelText: "Price",
        helperText: "Price can't be empty",
        //  hintText: "Dev Stack",
      ),
    );
  }

  Widget aboutTextField() {
    return TextFormField(
      controller: _about,
      validator: (value) {
        if (value.isEmpty) return "About can't be empty";

        return null;
      },
      maxLines: 4,
      decoration: InputDecoration(
        border: OutlineInputBorder(
            borderSide: BorderSide(
          color: Colors.teal,
        )),
        focusedBorder: OutlineInputBorder(
            borderSide: BorderSide(
          color: Colors.orange,
          width: 2,
        )),

        labelText: "About your land",
        helperText: "Write about your land",
        // hintText: "I am Dev Stack",
      ),
    );
  }
}
