import 'dart:convert';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:logger/logger.dart';

import '../../core/constants.dart';
import '../../core/custom/custom_font_weight.dart';
import '../../core/custom/custom_snack_bar.dart';
import '../../core/theme/theme_extension.dart';
import '../../domain/model/property/property_model.dart';
import '../bloc/property/property_bloc.bloc.dart';
import '../bloc/user/user_bloc.bloc.dart';
import '../cubit/message_cubit.dart';
import 'common/profile_routes_inkwell_widget.dart';

class ProfilePage extends StatefulWidget {
  const ProfilePage({super.key});

  @override
  State<ProfilePage> createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  @override
  void initState() {
    super.initState();
    context.read<PropertyBloc>().add(const LoadProperties());
  }
  @override
  Widget build(BuildContext context) {
    final logger = Logger();
    final colorScheme = context.colors;
    final textScheme = Theme.of(context).textTheme;

    return MultiBlocListener(
      listeners: [
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
              error: (message) {
                WidgetsBinding.instance.addPostFrameCallback((_) {
                  CustomSnackBar.showTopSnackBar(
                    context,
                    message,
                    isError: true,
                  );
                  context.read<MessageCubit>().clearMessage();
                });
              },
              none: () {},
            );
          },
        ),
      ],
      child: BlocBuilder<UserBloc, UserState>(
        builder: (context, state) {
          return state.maybeWhen(
            success: (user) {
              return BlocBuilder<PropertyBloc, PropertyState>(
                buildWhen: (previous, current) =>
                    current is PropertiesLoaded,
                builder: (context, state) {
                  return state.maybeWhen(orElse: ()=>const SizedBox.shrink(),propertiesLoaded: (properties){
                    List<PropertyModel> propertiesWithUser = properties
                        .where((property) => property.user!.uid == user.uid)
                        .toList();
                    return Scaffold(
                      backgroundColor: colorScheme.primaryBackground,
                      body: Column(
                        mainAxisSize: MainAxisSize.max,
                        children: [
                          Container(
                            width: MediaQuery.sizeOf(context).width,
                            height: 160,
                            decoration: BoxDecoration(color: colorScheme.dark600),
                            child: Padding(
                              padding: const EdgeInsetsDirectional.fromSTEB(20, 40, 20, 0),
                              child: Row(
                                mainAxisSize: MainAxisSize.max,
                                mainAxisAlignment: MainAxisAlignment.start,
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: [
                                  Card(
                                    clipBehavior: Clip.antiAliasWithSaveLayer,
                                    color: const Color(0xFF30B2A3),
                                    elevation: 0,
                                    shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(60),
                                    ),
                                    child: Padding(
                                      padding: const EdgeInsets.all(2),
                                      child: user.photoUrl!.isNotEmpty ? ClipRRect(
                                        borderRadius: BorderRadius.circular(60),
                                        child: user.photoUrl != null &&
                                            user.photoUrl!
                                                .startsWith(
                                              'data:image',
                                            )
                                            ? Image.memory(
                                          base64Decode(
                                            user.photoUrl!
                                                .split(',')
                                                .last,
                                          ),
                                          width: 80,
                                          height: 80,
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
                                          width: 80,
                                          height: 80,
                                          fit: BoxFit.cover,
                                        ),
                                      ):const SizedBox(height: 80, width: 80,),
                                    ),
                                  ),
                                  Padding(
                                    padding: const EdgeInsetsDirectional.fromSTEB(
                                      8,
                                      0,
                                      0,
                                      0,
                                    ),
                                    child: Column(
                                      mainAxisSize: MainAxisSize.max,
                                      mainAxisAlignment: MainAxisAlignment.center,
                                      crossAxisAlignment: CrossAxisAlignment.start,
                                      children: [
                                        Text(
                                          user.displayName!,
                                          style: GoogleFonts.lexendDeca(
                                            textStyle: textScheme.headlineSmall
                                                ?.copyWith(color: Colors.white),
                                          ),
                                        ),
                                        Text(
                                          user.email!,
                                          style: GoogleFonts.lexendDeca(
                                            textStyle: textScheme.bodyMedium
                                                ?.copyWith(
                                              fontWeight: CustomFontWeight.normal,
                                              color: colorScheme.primary,
                                            ),
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),

                          Column(
                            mainAxisSize: MainAxisSize.max,
                            children: [
                              if (!(Theme.of(context).brightness == Brightness.dark))
                                InkWell(
                                  splashColor: Colors.transparent,
                                  focusColor: Colors.transparent,
                                  hoverColor: Colors.transparent,
                                  highlightColor: Colors.transparent,
                                  onTap: () {
                                    //themeNotifier.value = themeNotifier.value == ThemeMode.light ? ThemeMode.dark : ThemeMode.light;
                                    AppConstants.themeNotifier.value = ThemeMode.dark;
                                  },
                                  child: Container(
                                    width: MediaQuery.sizeOf(context).width,
                                    decoration: BoxDecoration(
                                      color: colorScheme.dark600,
                                      boxShadow: [
                                        const BoxShadow(
                                          blurRadius: 1,
                                          color: Color(0xFF1A1F24),
                                          offset: Offset(0.0, 0),
                                        ),
                                      ],
                                    ),
                                    child: Padding(
                                      padding: const EdgeInsetsDirectional.fromSTEB(
                                        24,
                                        12,
                                        24,
                                        12,
                                      ),
                                      child: Row(
                                        mainAxisSize: MainAxisSize.max,
                                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                        children: [
                                          Text(
                                            'Switch to Dark Mode',
                                            style: GoogleFonts.outfit(
                                              textStyle: textScheme.bodyMedium?.copyWith(
                                                color: Colors.white,
                                              ),
                                            ),
                                          ),
                                          Container(
                                            width: 80,
                                            height: 40,
                                            decoration: BoxDecoration(
                                              color: const Color(0xFF1D2429),
                                              borderRadius: BorderRadius.circular(20),
                                            ),
                                            child: Stack(
                                              alignment: const AlignmentDirectional(0, 0),
                                              children: [
                                                const Align(
                                                  alignment: AlignmentDirectional(0.95, 0),
                                                  child: Padding(
                                                    padding: EdgeInsetsDirectional.fromSTEB(
                                                      0,
                                                      0,
                                                      8,
                                                      0,
                                                    ),
                                                    child: Icon(
                                                      Icons.nights_stay,
                                                      color: Color(0xFF95A1AC),
                                                      size: 20,
                                                    ),
                                                  ),
                                                ),
                                                Align(
                                                  alignment: const AlignmentDirectional(
                                                    -0.85,
                                                    0,
                                                  ),
                                                  child: Container(
                                                    width: 36,
                                                    height: 36,
                                                    decoration: BoxDecoration(
                                                      color: const Color(0xFF14181B),
                                                      boxShadow: [
                                                        const BoxShadow(
                                                          blurRadius: 4,
                                                          offset: Offset(0.0, 2),
                                                          color: Color(0x430B0D0F),
                                                        ),
                                                      ],
                                                      borderRadius: BorderRadius.circular(30),
                                                    ),
                                                  ),
                                                ),
                                              ],
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ),
                                ),
                              if (Theme.of(context).brightness == Brightness.dark)
                                InkWell(
                                  splashColor: Colors.transparent,
                                  focusColor: Colors.transparent,
                                  hoverColor: Colors.transparent,
                                  highlightColor: Colors.transparent,
                                  onTap: () {
                                    //themeNotifier.value = themeNotifier.value == ThemeMode.light ? ThemeMode.dark : ThemeMode.light;
                                    AppConstants.themeNotifier.value = ThemeMode.light;
                                  },
                                  child: Container(
                                    width: MediaQuery.sizeOf(context).width,
                                    decoration: BoxDecoration(
                                      color: colorScheme.dark600,
                                      boxShadow: [
                                        const BoxShadow(
                                          blurRadius: 1,
                                          color: Color(0xFF1A1F24),
                                          offset: Offset(0.0, 0),
                                        ),
                                      ],
                                    ),
                                    child: Padding(
                                      padding: const EdgeInsetsDirectional.fromSTEB(
                                        24,
                                        12,
                                        24,
                                        12,
                                      ),
                                      child: Row(
                                        mainAxisSize: MainAxisSize.max,
                                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                        children: [
                                          Text(
                                            'Switch to Light Mode',
                                            style: GoogleFonts.outfit(
                                              textStyle: textScheme.bodyMedium?.copyWith(
                                                color: Colors.white,
                                              ),
                                            ),
                                          ),
                                          Container(
                                            width: 80,
                                            height: 40,
                                            decoration: BoxDecoration(
                                              color: const Color(0xFF1D2429),
                                              borderRadius: BorderRadius.circular(20),
                                            ),
                                            child: Stack(
                                              alignment: const AlignmentDirectional(0, 0),
                                              children: [
                                                const Align(
                                                  alignment: AlignmentDirectional(-0.9, 0),
                                                  child: Padding(
                                                    padding: EdgeInsetsDirectional.fromSTEB(
                                                      8,
                                                      2,
                                                      0,
                                                      0,
                                                    ),
                                                    child: Icon(
                                                      Icons.wb_sunny_rounded,
                                                      color: Color(0xFF95A1AC),
                                                      size: 20,
                                                    ),
                                                  ),
                                                ),
                                                Align(
                                                  alignment: const AlignmentDirectional(
                                                    0.9,
                                                    0,
                                                  ),
                                                  child: Container(
                                                    width: 36,
                                                    height: 36,
                                                    decoration: BoxDecoration(
                                                      color: const Color(0xFF14181B),
                                                      boxShadow: [
                                                        const BoxShadow(
                                                          blurRadius: 4,
                                                          offset: Offset(0.0, 2),
                                                          color: Color(0x430B0D0F),
                                                        ),
                                                      ],
                                                      borderRadius: BorderRadius.circular(30),
                                                    ),
                                                  ),
                                                ),
                                              ],
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ),
                                ),

                              Row(
                                mainAxisSize: MainAxisSize.max,
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Material(
                                    color: Colors.transparent,
                                    elevation: 0,
                                    shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(0),
                                    ),
                                    child: Container(
                                      width: MediaQuery.sizeOf(context).width,
                                      height: 50,
                                      decoration: BoxDecoration(
                                        color: colorScheme.primaryBackground,
                                        boxShadow: [
                                          const BoxShadow(
                                            blurRadius: 0,
                                            offset: Offset(0.0, 2),
                                            color: Color(0xFFE3E5E7),
                                          ),
                                        ],
                                        borderRadius: BorderRadius.circular(0),
                                        border: Border.all(
                                          color: colorScheme.lineGray,
                                          width: 0,
                                        ),
                                      ),
                                      child: Padding(
                                        padding: const EdgeInsetsDirectional.fromSTEB(
                                          16,
                                          0,
                                          4,
                                          0,
                                        ),
                                        child: Row(
                                          mainAxisSize: MainAxisSize.max,
                                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                          children: [
                                            Text(
                                              'Account Details',
                                              style: GoogleFonts.urbanist(
                                                textStyle: textScheme.titleSmall,
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                              ProfileRoutesInkwellWidget(
                                title: 'Edit Profile',
                                isFirstRow: true,
                                onTapAction: () {
                                  context.push('/profile_edit');
                                },
                              ),
                              ProfileRoutesInkwellWidget(
                                title: 'Payment Information',
                                isFirstRow: false,
                                onTapAction: () {
                                  context.push('/profile_payment_edit');
                                },
                              ),
                              ProfileRoutesInkwellWidget(
                                title: 'Change Password',
                                isFirstRow: false,
                                onTapAction: () {
                                  context.push('/profile_change_password');
                                },
                              ),
                              ProfileRoutesInkwellWidget(
                                title: 'My Properties',
                                isFirstRow: false,
                                onTapAction: () {
                                  context.push('/profile_my_property');
                                },
                                tripCount: propertiesWithUser.length,
                              ),
                              ProfileRoutesInkwellWidget(
                                title: 'My Bookings',
                                isFirstRow: false,
                                onTapAction: () {
                                  context.push('/profile_my_bookings?hostId=${user.uid}');
                                },
                              ),
                              Padding(
                                padding: const EdgeInsetsDirectional.fromSTEB(0, 24, 0, 20),
                                child: ElevatedButton(
                                  onPressed: () {
                                    context.go('/login');
                                  },
                                  style: ButtonStyle(
                                    backgroundColor: WidgetStateProperty.all(
                                      colorScheme.secondaryBackground,
                                    ),
                                    elevation: WidgetStateProperty.all(0.0),
                                    side: WidgetStateProperty.all(
                                      BorderSide(
                                        color: colorScheme.secondaryBackground,
                                        width: 1.0,
                                      ),
                                    ),
                                    shape: WidgetStateProperty.all(
                                      RoundedRectangleBorder(
                                        borderRadius: BorderRadius.circular(40),
                                      ),
                                    ),
                                    minimumSize: WidgetStateProperty.all(const Size(110, 50)),
                                  ),
                                  child: Text(
                                    'Log Out',
                                    style: GoogleFonts.lexendDeca(
                                      textStyle: textScheme.titleSmall?.copyWith(
                                        fontWeight: CustomFontWeight.medium,
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                              ElevatedButton(
                                onPressed: () {
                                  context.push('/property_editor_wrapper');
                                },
                                style: ButtonStyle(
                                  backgroundColor: WidgetStateProperty.all(
                                    colorScheme.primary,
                                  ),
                                  elevation: WidgetStateProperty.all(2.0),
                                  side: WidgetStateProperty.all(
                                    const BorderSide(color: Colors.transparent, width: 1.0),
                                  ),
                                  shape: WidgetStateProperty.all(
                                    RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(40),
                                    ),
                                  ),
                                  minimumSize: WidgetStateProperty.all(const Size(240, 60)),
                                ),
                                child: Text(
                                  'Add Property',
                                  style: GoogleFonts.urbanist(
                                    textStyle: textScheme.titleSmall?.copyWith(
                                      color: Colors.white,
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    );
                  });
                }
              );
            },
            orElse: () => const SizedBox.shrink(),
          );
        }
      ),
    );
  }
}
