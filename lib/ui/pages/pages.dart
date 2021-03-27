import 'dart:io';

import 'package:email_validator/email_validator.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flushbar/flushbar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:image_picker/image_picker.dart';
import 'package:introduction_screen/introduction_screen.dart';
import 'package:provider/provider.dart';
import 'package:seekr/bloc/blocs.dart';
import 'package:seekr/models/models.dart';
import 'package:seekr/services/services.dart';  
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:seekr/shared/shared.dart';

part 'main_page.dart';
part 'sign_in_page.dart';
part 'wrapper.dart';
part 'splash_page.dart';
part 'onboarding.dart';
part 'sign_up_page.dart';
part 'account_confirmation_page.dart';

Future<File> getImage() async {   
  var image = await ImagePicker.pickImage(source: ImageSource.gallery);
  return image;
}
