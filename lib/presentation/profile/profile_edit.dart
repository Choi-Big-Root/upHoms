import 'dart:convert';
import 'dart:io';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:image_picker/image_picker.dart';

import '../../core/custom/custom_font_weight.dart';
import '../../core/custom/custom_snack_bar.dart';
import '../../core/theme/theme_extension.dart';
import '../../core/utils/validators.dart';
import '../../domain/model/user/user_model.dart';
import '../bloc/user/user_bloc.bloc.dart';
import '../cubit/message_cubit.dart';

class ProfileEdit extends StatefulWidget {
  const ProfileEdit({super.key});

  @override
  State<ProfileEdit> createState() => _ProfileEditState();
}

class _ProfileEditState extends State<ProfileEdit> {
  final GlobalKey<FormState> _formKey = GlobalKey();
  final TextEditingController _fullNameTextController = TextEditingController();
  final TextEditingController _emailTextController = TextEditingController();
  final TextEditingController _bioTextController = TextEditingController();

  XFile? _selectedImageFile;
  String? _selectedImageBase64;

  UserModel _saveForm(UserModel user) {
    final userModel = UserModel(
      uid: user.uid,
      displayName: _fullNameTextController.text,
      email: _emailTextController.text,
      bio: _bioTextController.text ?? '',
      photoUrl: _selectedImageBase64 ?? user.photoUrl!,
    );
    return userModel;
  }

  void _onPressedLogin(UserModel user) {
    if (_formKey.currentState!.validate()) {
      context.read<UserBloc>().add(UpdateUser(_saveForm(user)));
    }
  }

  Future<void> _pickImage(ImageSource source) async {
    final ImagePicker picker = ImagePicker();
    final XFile? image = await picker.pickImage(source: source);

    if (image != null) {
      final bytes = await image.readAsBytes();
      setState(() {
        _selectedImageFile = image;
        final String fileExtension = image.path.split('.').last.toLowerCase();
        final String mimeType =
            'image/${fileExtension == 'jpg' ? 'jpeg' : fileExtension}';
        _selectedImageBase64 = 'data:$mimeType;base64,${base64Encode(bytes)}';
      });
    }
  }

  void _showImageSourceSelection() {
    showModalBottomSheet(
      context: context,
      builder: (BuildContext context) {
        return Container(
          color: context.colors.secondaryBackground,
          child: SafeArea(
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: <Widget>[
                ListTile(
                  leading: const Icon(Icons.camera_alt),
                  title: const Text('Camera'),
                  onTap: () {
                    Navigator.pop(context);
                    _pickImage(ImageSource.camera);
                  },
                ),
                ListTile(
                  leading: const Icon(Icons.photo_library),
                  title: const Text('Gallery'),
                  onTap: () {
                    Navigator.pop(context);
                    _pickImage(ImageSource.gallery);
                  },
                ),
              ],
            ),
          ),
        );
      },
    );
  }

  @override
  void dispose() {
    super.dispose();
    _fullNameTextController.dispose();
    _emailTextController.dispose();
    _bioTextController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final colorScheme = context.colors;
    final textScheme = Theme.of(context).textTheme;
    return MultiBlocListener(
      listeners: [
        BlocListener<UserBloc, UserState>(
          listener: (BuildContext context, UserState state) {
            state.when(
              initial: () {},
              loading: () {
                const CircularProgressIndicator();
              },
              success: (data) async {
                context.read<MessageCubit>().showSuccessMessage(
                  '사용자 내용 변경 성공!',
                );
                context.go('/profile');
              },
              error: (message) {
                CustomSnackBar.showTopSnackBar(
                  context,
                  message,
                  isError: true, // 에러 스타일 적용
                );
              },
            );
          },
        ),
        BlocListener<MessageCubit, MessageState>(
          listener: (context, state) {
            state.when(
              initial: () {},
              success: (message, onDismissed) {
                WidgetsBinding.instance.addPostFrameCallback((_) {
                  CustomSnackBar.showTopSnackBar(
                    context,
                    message,
                    isError: false,
                    onDismissed: onDismissed,
                  );
                  context.read<MessageCubit>().clearMessage();
                });
              },
              error: (message) {},
              none: () {},
            );
          },
        ),
      ],
      child: BlocBuilder<UserBloc, UserState>(
        builder: (context, state) {
          return state.maybeWhen(
            orElse: () => const SizedBox.shrink(),
            success: (user) {
              _fullNameTextController.text = user.displayName!;
              _emailTextController.text = user.email!;
              _bioTextController.text = user.bio!;
              return Scaffold(
                backgroundColor: colorScheme.secondaryBackground,
                appBar: AppBar(
                  backgroundColor: colorScheme.secondaryBackground,
                  automaticallyImplyLeading: false,
                  leading: InkWell(
                    splashColor: Colors.transparent,
                    focusColor: Colors.transparent,
                    hoverColor: Colors.transparent,
                    highlightColor: Colors.transparent,
                    onTap: () async {
                      context.pop();
                    },
                    child: Icon(
                      Icons.arrow_back_rounded,
                      color: colorScheme.primaryText,
                      size: 24,
                    ),
                  ),
                  title: Text(
                    'Edit Profile',
                    style: GoogleFonts.urbanist(
                      textStyle: textScheme.titleSmall,
                    ),
                  ),
                  actions: [],
                  centerTitle: true,
                  elevation: 0,
                ),
                body: SafeArea(
                  top: true,
                  child: Form(
                    key: _formKey,
                    child: Column(
                      mainAxisSize: MainAxisSize.max,
                      children: [
                        Row(
                          mainAxisSize: MainAxisSize.max,
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Container(
                              width: 100,
                              height: 100,
                              decoration: const BoxDecoration(
                                color: Color(0xFFDBE7E7),
                                shape: BoxShape.circle,
                              ),
                              child: Padding(
                                padding: const EdgeInsets.all(2.0),
                                child: _selectedImageFile == null
                                    ? user.photoUrl!.isNotEmpty
                                          ? ClipRRect(
                                              borderRadius:
                                                  BorderRadius.circular(60),
                                              child:
                                                  user.photoUrl != null &&
                                                      user.photoUrl!.startsWith(
                                                        'data:image',
                                                      )
                                                  ? Image.memory(
                                                      base64Decode(
                                                        user.photoUrl!
                                                            .split(',')
                                                            .last,
                                                      ),
                                                      width: 90,
                                                      height: 90,
                                                      fit: BoxFit.cover,
                                                    )
                                                  : CachedNetworkImage(
                                                      fadeInDuration:
                                                          const Duration(
                                                            milliseconds: 500,
                                                          ),
                                                      fadeOutDuration:
                                                          const Duration(
                                                            milliseconds: 500,
                                                          ),
                                                      imageUrl:
                                                          user.photoUrl ??
                                                          'https://picsum.photos/id/238/200/200.jpg',
                                                      width: 90,
                                                      height: 90,
                                                      fit: BoxFit.cover,
                                                    ),
                                            )
                                          : const SizedBox(
                                              height: 90,
                                              width: 90,
                                            )
                                    : ClipRRect(
                                        borderRadius: BorderRadius.circular(60),
                                        child: Image.file(
                                          File(_selectedImageFile!.path),
                                          width: 90,
                                          height: 90,
                                          fit: BoxFit.cover,
                                        ),
                                      ),
                              ),
                            ),
                          ],
                        ),
                        Padding(
                          padding: const EdgeInsetsDirectional.fromSTEB(
                            0,
                            12,
                            0,
                            16,
                          ),
                          child: ElevatedButton(
                            onPressed: _showImageSourceSelection,
                            style: ButtonStyle(
                              backgroundColor: WidgetStateProperty.all(
                                colorScheme.lineGray,
                              ),
                              elevation: WidgetStateProperty.all(2.0),
                              side: WidgetStateProperty.all(
                                const BorderSide(
                                  color: Colors.transparent,
                                  width: 1.0,
                                ),
                              ),
                              shape: WidgetStateProperty.all(
                                RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(8),
                                ),
                              ),
                              minimumSize: WidgetStateProperty.all(
                                const Size(130, 40),
                              ),
                            ),
                            child: Text(
                              'Change Photo',
                              style: GoogleFonts.lexendDeca(
                                textStyle: textScheme.bodyMedium?.copyWith(
                                  fontWeight: CustomFontWeight.normal,
                                  color: colorScheme.primary,
                                ),
                              ),
                            ),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsetsDirectional.fromSTEB(
                            20,
                            0,
                            20,
                            16,
                          ),
                          child: TextFormField(
                            controller: _fullNameTextController,
                            obscureText: false,
                            decoration: InputDecoration(
                              labelText: 'Full Name',
                              labelStyle: GoogleFonts.urbanist(
                                textStyle: textScheme.bodyMedium,
                              ),
                              hintText: 'Your full name..',
                              hintStyle: GoogleFonts.urbanist(
                                textStyle: textScheme.bodyMedium,
                              ),
                              enabledBorder: OutlineInputBorder(
                                borderSide: BorderSide(
                                  color: colorScheme.lineGray,
                                  width: 2,
                                ),
                                borderRadius: BorderRadius.circular(8),
                              ),
                              focusedBorder: OutlineInputBorder(
                                borderSide: BorderSide(
                                  color: colorScheme.lineGray,
                                  width: 2,
                                ),
                                borderRadius: BorderRadius.circular(8),
                              ),
                              errorBorder: OutlineInputBorder(
                                borderSide: const BorderSide(
                                  color: Color(0x00000000),
                                  width: 2,
                                ),
                                borderRadius: BorderRadius.circular(8),
                              ),
                              focusedErrorBorder: OutlineInputBorder(
                                borderSide: const BorderSide(
                                  color: Color(0x00000000),
                                  width: 2,
                                ),
                                borderRadius: BorderRadius.circular(8),
                              ),
                              filled: true,
                              fillColor: colorScheme.secondaryBackground,
                              contentPadding:
                                  const EdgeInsetsDirectional.fromSTEB(
                                    20,
                                    24,
                                    0,
                                    24,
                                  ),
                              //suffixIcon: InkWell(onTap: () {}, child: ,),
                            ),
                            style: GoogleFonts.urbanist(
                              textStyle: textScheme.titleSmall,
                            ),
                            validator: (value) {
                              return AppValidators.validateRequired(
                                value,
                                '이름',
                              );
                            },
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsetsDirectional.fromSTEB(
                            20,
                            0,
                            20,
                            12,
                          ),
                          child: TextFormField(
                            controller: _emailTextController,
                            obscureText: false,
                            decoration: InputDecoration(
                              labelText: 'Email Address',
                              labelStyle: GoogleFonts.urbanist(
                                textStyle: textScheme.bodyMedium,
                              ),
                              hintText: 'Your email..',
                              hintStyle: GoogleFonts.urbanist(
                                textStyle: textScheme.bodyMedium,
                              ),
                              enabledBorder: OutlineInputBorder(
                                borderSide: BorderSide(
                                  color: colorScheme.lineGray,
                                  width: 2,
                                ),
                                borderRadius: BorderRadius.circular(8),
                              ),
                              focusedBorder: OutlineInputBorder(
                                borderSide: BorderSide(
                                  color: colorScheme.lineGray,
                                  width: 2,
                                ),
                                borderRadius: BorderRadius.circular(8),
                              ),
                              errorBorder: OutlineInputBorder(
                                borderSide: const BorderSide(
                                  color: Color(0x00000000),
                                  width: 2,
                                ),
                                borderRadius: BorderRadius.circular(8),
                              ),
                              focusedErrorBorder: OutlineInputBorder(
                                borderSide: const BorderSide(
                                  color: Color(0x00000000),
                                  width: 2,
                                ),
                                borderRadius: BorderRadius.circular(8),
                              ),
                              filled: true,
                              fillColor: colorScheme.secondaryBackground,
                              contentPadding:
                                  const EdgeInsetsDirectional.fromSTEB(
                                    20,
                                    24,
                                    0,
                                    24,
                                  ),
                              //suffixIcon: InkWell(onTap: () {}, child: ,),
                            ),
                            style: GoogleFonts.urbanist(
                              textStyle: textScheme.titleSmall,
                            ),
                            validator: (value) {
                              return AppValidators.validateRequired(
                                value,
                                '이메일',
                              );
                            },
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsetsDirectional.fromSTEB(
                            20,
                            0,
                            20,
                            12,
                          ),
                          child: TextFormField(
                            controller: _bioTextController,
                            maxLines: 3,
                            obscureText: false,
                            decoration: InputDecoration(
                              labelText: 'Bio',
                              labelStyle: GoogleFonts.urbanist(
                                textStyle: textScheme.bodyMedium,
                              ),
                              hintText: 'A title about you..',
                              hintStyle: GoogleFonts.urbanist(
                                textStyle: textScheme.bodyMedium,
                              ),
                              enabledBorder: OutlineInputBorder(
                                borderSide: BorderSide(
                                  color: colorScheme.lineGray,
                                  width: 2,
                                ),
                                borderRadius: BorderRadius.circular(8),
                              ),
                              focusedBorder: OutlineInputBorder(
                                borderSide: BorderSide(
                                  color: colorScheme.lineGray,
                                  width: 2,
                                ),
                                borderRadius: BorderRadius.circular(8),
                              ),
                              errorBorder: OutlineInputBorder(
                                borderSide: const BorderSide(
                                  color: Color(0x00000000),
                                  width: 2,
                                ),
                                borderRadius: BorderRadius.circular(8),
                              ),
                              focusedErrorBorder: OutlineInputBorder(
                                borderSide: const BorderSide(
                                  color: Color(0x00000000),
                                  width: 2,
                                ),
                                borderRadius: BorderRadius.circular(8),
                              ),
                              filled: true,
                              fillColor: colorScheme.secondaryBackground,
                              contentPadding:
                                  const EdgeInsetsDirectional.fromSTEB(
                                    20,
                                    24,
                                    0,
                                    24,
                                  ),
                              //suffixIcon: InkWell(onTap: () {}, child: ,),
                            ),
                            style: GoogleFonts.urbanist(
                              textStyle: textScheme.titleSmall,
                            ),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsetsGeometry.fromSTEB(
                            0,
                            24,
                            0,
                            0,
                          ),
                          child: ElevatedButton(
                            onPressed: () {
                              _onPressedLogin(user);
                            },
                            style: ButtonStyle(
                              backgroundColor: WidgetStateProperty.all(
                                colorScheme.primary,
                              ),
                              elevation: WidgetStateProperty.all(2.0),
                              side: WidgetStateProperty.all(
                                const BorderSide(
                                  color: Colors.transparent,
                                  width: 1.0,
                                ),
                              ),
                              shape: WidgetStateProperty.all(
                                RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(30),
                                ),
                              ),
                              minimumSize: WidgetStateProperty.all(
                                const Size(340, 60),
                              ),
                            ),
                            child: Text(
                              'Save Changes',
                              style: GoogleFonts.lexendDeca(
                                textStyle: textScheme.titleSmall?.copyWith(
                                  fontWeight: CustomFontWeight.normal,
                                  color: Colors.white,
                                ),
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              );
            },
          );
        },
      ),
    );
  }
}
