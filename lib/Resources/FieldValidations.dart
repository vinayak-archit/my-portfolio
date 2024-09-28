import 'dart:async';
import 'package:rxdart/rxdart.dart';

class AppValidation {
  final _phoneNumber = BehaviorSubject<String>.seeded('');
  final _password = BehaviorSubject<String>.seeded('');
  final _forgotPassword = BehaviorSubject<String>.seeded("");
  final _confirmPassword = BehaviorSubject<String>.seeded("");
  final _fullName = BehaviorSubject<String>.seeded('');
  final _businessName = BehaviorSubject<String>.seeded('');
  final _email = BehaviorSubject<String>.seeded('');
  final _price = BehaviorSubject<String>.seeded('');
  final _emailAndPhone = BehaviorSubject<String>.seeded('');
  final _address = BehaviorSubject<String>.seeded('');
  final _mendatory = BehaviorSubject<String>.seeded('');
  final _mendatory1 = BehaviorSubject<String>.seeded('');
  final _firmName = BehaviorSubject<String>.seeded('');
  final _oldPassword = BehaviorSubject<String>.seeded('');
  final _url = BehaviorSubject<String>.seeded('');

  Stream<String> get firmName => _firmName.stream.transform(validateEntry);

  Sink<String> get sinkFirmName => _firmName.sink;

  Stream<String> get address => _address.stream.transform(validateEntry);

  Sink<String> get sinkAddress => _address.sink;

  Stream<String> get mendatory =>
      _mendatory.stream.transform(validateMendatoryField);

  Sink<String> get sinkmendatory => _mendatory.sink;

  Stream<String> get mendatory1 =>
      _mendatory1.stream.transform(validateMendatoryField1);

  Sink<String> get sinkmendatory1 => _mendatory1.sink;

  Stream<String> get businessName =>
      _businessName.stream.transform(validateBusinessName);

  Sink<String> get sinkBusinessName => _businessName.sink;

  Stream<String> get fullName => _fullName.stream.transform(validateFullName);

  Sink<String> get sinkName => _fullName.sink;

  Stream<String> get phoneNo => _phoneNumber.stream.transform(validatePhoneNo);

  Sink<String> get sinkPhoneNo => _phoneNumber.sink;

  Stream<String> get forgotPassword =>
      _forgotPassword.stream.transform(validatePhoneNo);

  Sink<String> get sinkForgot => _forgotPassword.sink;

  Stream<String> get password => _password.stream.transform(validatePassword);

  Sink<String> get sinkPassword => _password.sink;

  Stream<String> get oldPassword =>
      _oldPassword.stream.transform(validatePassword);

  Sink<String> get sinkoldPassword => _oldPassword.sink;

  Stream<String> get confirmPassword =>
      _confirmPassword.stream.transform(validatePassword);

  Sink<String> get sinkConfirmPassword => _confirmPassword.sink;

  Stream<String> get email => _email.stream.transform(validateEmail);

  Stream<String> get price => _price.stream.transform(validatePrice);

  Sink<String> get sinkEmail => _email.sink;
  Sink<String> get sinkPrice => _price.sink;

  Stream<String> get emailAndMobile =>
      _emailAndPhone.stream.transform(validateEmailAndPhone);

  Sink<String> get sinkEmailAndPhone => _emailAndPhone.sink;

  Stream<String> get url => _url.stream.transform(validateEntry);

  Sink<String> get sinkUrl => _url.sink;

  Stream<bool> get checkPhoneValidate =>
      Rx.combineLatest({emailAndMobile}, (values) => true);

  Stream<bool> get checkResetPasswordValidate =>
      Rx.combineLatest2(password, confirmPassword, (a, b) => true);

  Stream<bool> get registerUser => Rx.combineLatest4(
      fullName, email, phoneNo, password, (a, b, c, d) => true);

  // Stream<bool> get passwordValid => Rx.combineLatest3(
  // fullName, email, password, (a, b, c ) => true);

  Stream<bool> get registerRetailerUser => Rx.combineLatest5(
      fullName, email, phoneNo, password, url, (a, b, c, d, e) => true);

  Stream<bool> get registerDetailUser => Rx.combineLatest4(
      fullName, email, phoneNo, address, (a, b, c, d) => true);

  Stream<bool> get checkUserInfoValidate =>
      Rx.combineLatest2(email, phoneNo, (a, b) => true);

  Stream<bool> get submitValid =>
      Rx.combineLatest2(emailAndMobile, password, (e, p) => true);

  Stream<bool> get passwordValid =>
      Rx.combineLatest2(password, confirmPassword, (a, b) => true);

  Stream<bool> get validateRetailerEditProfile =>
      Rx.combineLatest4(fullName, phoneNo, email, url, (a, b, c, d) => true);

  final validatePrice =
      StreamTransformer<String, String>.fromHandlers(handleData: (value, sink) {
    if (value.isNotEmpty) {
      isRupees(value)
          ? sink.add(value)
          : sink.addError('Please fill the price');
    }
  });

  static bool isRupees(String rupees) {
    String value = r'(?=.*?\d)^\$?(([1-9]\d{0,2}(,\d{3})*)|\d+)?(\.\d{1,2})?$';
    RegExp regExp = RegExp(value);
    return regExp.hasMatch(rupees);
  }

  final validateDescription =
      StreamTransformer<String, String>.fromHandlers(handleData: (value, sink) {
    value.length > 10
        ? sink.add(value)
        : sink.addError("Description must be in 10 characters");
  });

  final validateText =
      StreamTransformer<String, String>.fromHandlers(handleData: (value, sink) {
    value.length > 10 ? sink.add(value) : sink.addError("Too Short");
  });

  final validateEntry =
      StreamTransformer<String, String>.fromHandlers(handleData: (value, sink) {
    if (value.isNotEmpty) {
      value.length > 5 ? sink.add(value) : sink.addError("Too Short");
    }
  });

  final validateMendatoryField =
      StreamTransformer<String, String>.fromHandlers(handleData: (value, sink) {
    value.isNotEmpty
        ? sink.add(value)
        : sink.addError("This field is mandatory");
  });

  final validateMendatoryField1 =
      StreamTransformer<String, String>.fromHandlers(handleData: (value, sink) {
    value.isNotEmpty
        ? sink.add(value)
        : sink.addError("This field is mandatory");
  });

  static bool isName(String name) {
    String value = r'(^[a-zA-Z ]*$)';
    RegExp regExp = RegExp(value);
    return regExp.hasMatch(name);
  }

  final validateBusinessName =
      StreamTransformer<String, String>.fromHandlers(handleData: (value, sink) {
    if (value.isNotEmpty) {
      isName(value)
          ? value.length >= 0
              ? sink.add(value)
              : sink.addError('Name should be atleast 2 character')
          : sink.addError('Name must be a-z and A-Z');
    }
  });

  final validateFullName =
      StreamTransformer<String, String>.fromHandlers(handleData: (value, sink) {
    if (value.isNotEmpty) {
      isFullName(value)
          ? value.length >= 0
              ? sink.add(value)
              : sink.addError('Name should be atleast 2 character')
          : sink.addError('Name must be a-z and A-Z');
    }
  });

  static bool isFullName(String name) {
    String value = r'(^[a-zA-Z ]*$)';
    RegExp regExp = RegExp(value);
    return regExp.hasMatch(name);
  }

  final validateLastName =
      StreamTransformer<String, String>.fromHandlers(handleData: (value, sink) {
    if (value.isNotEmpty) {
      isFullName(value)
          // ? value.length >= 2
          ? sink.add(value)
          // : sink.addError('Name should be atleast 2 character')
          : sink.addError('Name must be a-z and A-Z');
    }
  });

  static bool isLastName(String name) {
    String value = r'(^[a-zA-Z ]*$)';
    RegExp regExp = RegExp(value);
    return regExp.hasMatch(name);
  }

  static String? validatePinNumber(String value) {
    String pattern = r'(^[0-9]*$)';
    RegExp regExp = RegExp(pattern);
    if (value.isEmpty) {
      return "PIN  is Required";
    } else if (value.length != 4) {
      return "PIN must 4 digits";
    } else if (!regExp.hasMatch(value)) {
      return "PIN must be digits";
    }
    return '';
  }

  static bool isEmail(String email) {
    String value =
        r'^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$';
    RegExp regExp = RegExp(value);
    return regExp.hasMatch(email);
  }

  final validateEmail =
      StreamTransformer<String, String>.fromHandlers(handleData: (value, sink) {
    if (value.isNotEmpty) {
      isEmail(value)
          ? sink.add(value)
          : sink.addError("Please enter a valid email address");
    }
  });

  final validateEmailAndPhone =
      StreamTransformer<String, String>.fromHandlers(handleData: (value, sink) {
    if (value.isNotEmpty) {
      if (!isEmail(value) && !isPhone(value)) {
        return sink.addError("Please enter a valid email or phone number.");
      } else if (value.length < 10) {
        return sink.addError("Please enter a valid email or phone number.");
      } else {
        return sink.add(value);
      }
    }
  });

  static bool isPhone(String phoneNo) {
    String value = r'(^[0-9]*$)';
    RegExp regExp = RegExp(value);
    return regExp.hasMatch(phoneNo);
  }

  final validatePhoneNo =
      StreamTransformer<String, String>.fromHandlers(handleData: (value, sink) {
    if (value.isNotEmpty) {
      isPhone(value)
          ? value.length == 10
              ? sink.add(value)
              : sink.addError('Mobile Number must be 10 digits')
          : sink.addError('Mobile Number must be digits');
    }
  });

  static bool isPassword(String password) {
    String value = r'^(?=.*?[A-Z])(?=.*?[0-9])(?=.*?[!@#\$&*~]).{8,}$';
    RegExp regExp = RegExp(value);
    return regExp.hasMatch(password);
  }

  final validatePassword =
      StreamTransformer<String, String>.fromHandlers(handleData: (value, sink) {
    if (value.isNotEmpty) {
      isPassword(value)
          ? sink.add(value)
          : sink.addError(
              'Password must be at least 8 characters long, include 1 uppercase letter, include 1 lowercase letter, 1 number and 1 special character.');
    }
  });

  final validateDropDown =
      StreamTransformer<String, String>.fromHandlers(handleData: (value, sink) {
    value.isNotEmpty
        ? sink.add(value)
        : sink.addError("Please select the value.");
  });

  void closeStream() {
    _phoneNumber.close();
    _password.close();
    _forgotPassword.close();
    _confirmPassword.close();
    _businessName.close();
    _fullName.close();
    _email.close();
    _address.close();
    _firmName.close();
    _emailAndPhone.close();
    _oldPassword.close();
    _url.close();
  }
}
