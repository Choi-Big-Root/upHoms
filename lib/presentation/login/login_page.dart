import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:http/http.dart' as http;
import '../../core/custom/custom_font_weight.dart';
import '../../core/theme/theme_extension.dart';
import '../../data/datasources/user_remote_data_source.dart';
import '../../data/repositories/user_repository_impl.dart';
import '../../domain/usecases/login_usecase.dart';
import 'bloc/login_bloc.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final TextEditingController _idController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  var showPassword = false;

  @override
  void dispose() {
    _idController.dispose();
    _passwordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final colorScheme = context.colors;
    final textScheme = Theme.of(context).textTheme;
    return BlocProvider(
      create: (context) => LoginBloc(
        loginUseCase: LoginUseCase(
          UserRepositoryImpl(
            remoteDataSource: UserRemoteDataSourceImpl(client: http.Client()),
          ),
        ),
      ),
      child: BlocConsumer<LoginBloc, LoginState>(
        listener: (context, state) {
          state.whenOrNull(
            success: (user) {
              ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(content: Text('Login Success: ${user.name}')),
              );
              context.go('/home');
            },
            failure: (message) {
              ScaffoldMessenger.of(
                context,
              ).showSnackBar(SnackBar(content: Text('Login Failed: $message')));
            },
          );
        },
        builder: (context, state) {
          return Scaffold(
            backgroundColor: colorScheme.primary,
            body: Container(
              width: MediaQuery.sizeOf(context).width,
              height: MediaQuery.sizeOf(context).height,
              decoration: BoxDecoration(
                color: colorScheme.tertiary,
                image: DecorationImage(
                  fit: BoxFit.fitWidth,
                  image: Image.network(
                    'https://picsum.photos/id/338/200/400.jpg',
                  ).image,
                ),
              ),
              child: Column(
                mainAxisSize: MainAxisSize.max,
                children: [
                  Container(
                    width: double.infinity,
                    height: 500,
                    decoration: BoxDecoration(
                      color: colorScheme.secondaryBackground,
                      boxShadow: [
                        const BoxShadow(
                          blurRadius: 7,
                          color: Color(0x4D090F13),
                          offset: Offset(0.0, 3),
                        ),
                      ],
                      borderRadius: const BorderRadius.only(
                        bottomLeft: Radius.circular(16),
                        bottomRight: Radius.circular(16),
                        topLeft: Radius.circular(0),
                        topRight: Radius.circular(0),
                      ),
                    ),
                    child: Padding(
                      padding: const EdgeInsetsDirectional.fromSTEB(
                        20,
                        0,
                        20,
                        0,
                      ),
                      child: SingleChildScrollView(
                        child: Column(
                          mainAxisSize: MainAxisSize.max,
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Padding(
                              padding: const EdgeInsets.only(top: 56),
                              child: Row(
                                mainAxisSize: MainAxisSize.max,
                                children: [
                                  if (!(Theme.of(context).brightness ==
                                      Brightness.dark))
                                    Image.network(
                                      'https://picsum.photos/id/238/200/200.jpg',
                                      width: 200,
                                      height: 60,
                                      fit: BoxFit.fitWidth,
                                    ),
                                  if (Theme.of(context).brightness ==
                                      Brightness.dark)
                                    Image.network(
                                      'https://picsum.photos/id/238/200/200.jpg',
                                      width: 200,
                                      height: 60,
                                      fit: BoxFit.fitWidth,
                                    ),
                                ],
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsetsDirectional.fromSTEB(
                                0,
                                16,
                                0,
                                4,
                              ),
                              child: Align(
                                alignment: Alignment.centerLeft,
                                child: Text(
                                  'Welcome Back,',
                                  style: GoogleFonts.urbanist(
                                    textStyle: textScheme.displaySmall,
                                    letterSpacing: 0.0,
                                  ),
                                ),
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.only(top: 16),
                              child: Row(
                                mainAxisSize: MainAxisSize.max,
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Expanded(
                                    child: TextFormField(
                                      controller: _idController,
                                      obscureText: false,
                                      decoration: InputDecoration(
                                        labelText: 'Email Address',
                                        labelStyle: GoogleFonts.urbanist(
                                          textStyle: textScheme.bodyMedium,
                                          letterSpacing: 0.0,
                                        ),
                                        hintText: 'Enter your email here...',
                                        hintStyle: GoogleFonts.urbanist(
                                          textStyle: textScheme.bodyMedium,
                                          letterSpacing: 0.0,
                                        ),
                                        enabledBorder: OutlineInputBorder(
                                          borderSide: BorderSide(
                                            color: colorScheme.lineGray,
                                            width: 2,
                                          ),
                                          borderRadius: BorderRadius.circular(
                                            8,
                                          ),
                                        ),
                                        focusedBorder: OutlineInputBorder(
                                          borderSide: const BorderSide(
                                            color: Color(0X00000000),
                                            width: 2,
                                          ),
                                          borderRadius: BorderRadius.circular(
                                            8,
                                          ),
                                        ),
                                        errorBorder: OutlineInputBorder(
                                          borderSide: const BorderSide(
                                            color: Color(0X00000000),
                                            width: 2,
                                          ),
                                          borderRadius: BorderRadius.circular(
                                            8,
                                          ),
                                        ),
                                        focusedErrorBorder: OutlineInputBorder(
                                          borderSide: const BorderSide(
                                            color: Color(0X00000000),
                                            width: 2,
                                          ),
                                          borderRadius: BorderRadius.circular(
                                            8,
                                          ),
                                        ),
                                        filled: true,
                                        fillColor:
                                            colorScheme.secondaryBackground,
                                        contentPadding:
                                            const EdgeInsetsDirectional.fromSTEB(
                                              16,
                                              24,
                                              0,
                                              24,
                                            ),
                                      ),
                                      style: GoogleFonts.urbanist(
                                        textStyle: textScheme.titleSmall,
                                        letterSpacing: 0.0,
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.only(top: 16),
                              child: Row(
                                mainAxisSize: MainAxisSize.max,
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Expanded(
                                    child: TextFormField(
                                      controller: _passwordController,
                                      obscureText: !showPassword,
                                      decoration: InputDecoration(
                                        labelText: 'Password',
                                        labelStyle: GoogleFonts.urbanist(
                                          textStyle: textScheme.bodyMedium,
                                          letterSpacing: 0.0,
                                        ),
                                        hintText: 'Enter your password here...',
                                        hintStyle: GoogleFonts.urbanist(
                                          textStyle: textScheme.bodyMedium,
                                          letterSpacing: 0.0,
                                        ),
                                        enabledBorder: OutlineInputBorder(
                                          borderSide: BorderSide(
                                            color: colorScheme.lineGray,
                                            width: 2,
                                          ),
                                          borderRadius: BorderRadius.circular(
                                            8,
                                          ),
                                        ),
                                        focusedBorder: OutlineInputBorder(
                                          borderSide: const BorderSide(
                                            color: Color(0x00000000),
                                            width: 2,
                                          ),
                                          borderRadius: BorderRadius.circular(
                                            8,
                                          ),
                                        ),
                                        errorBorder: OutlineInputBorder(
                                          borderSide: const BorderSide(
                                            color: Color(0x00000000),
                                            width: 2,
                                          ),
                                          borderRadius: BorderRadius.circular(
                                            8,
                                          ),
                                        ),
                                        focusedErrorBorder: OutlineInputBorder(
                                          borderSide: const BorderSide(
                                            color: Color(0x00000000),
                                            width: 2,
                                          ),
                                          borderRadius: BorderRadius.circular(
                                            8,
                                          ),
                                        ),
                                        filled: true,
                                        fillColor:
                                            colorScheme.secondaryBackground,
                                        contentPadding:
                                            const EdgeInsetsDirectional.fromSTEB(
                                              16,
                                              24,
                                              24,
                                              24,
                                            ),
                                        suffixIcon: InkWell(
                                          onTap: () {
                                            setState(() {
                                              showPassword = !showPassword;
                                            });
                                          },
                                          child: Icon(
                                            showPassword
                                                ? Icons.visibility_outlined
                                                : Icons.visibility_off_outlined,
                                            color: const Color(0xFF95A1AC),
                                            size: 22,
                                          ),
                                        ),
                                      ),
                                      style: GoogleFonts.urbanist(
                                        textStyle: textScheme.titleSmall,
                                        letterSpacing: 0.0,
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsetsDirectional.fromSTEB(
                                0,
                                24,
                                0,
                                0,
                              ),
                              child: Row(
                                mainAxisSize: MainAxisSize.max,
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  TextButton(
                                    onPressed: () {},
                                    child: SizedBox(
                                      width: 170,
                                      child: Text(
                                        'Forgot Password?',
                                        textAlign: TextAlign.center,
                                        style: GoogleFonts.urbanist(
                                          textStyle: textScheme.titleSmall,
                                          letterSpacing: 0.0,
                                        ),
                                      ),
                                    ),
                                  ),
                                  Padding(
                                    padding:
                                        const EdgeInsetsDirectional.fromSTEB(
                                          0,
                                          0,
                                          4,
                                          0,
                                        ),
                                    child: SizedBox(
                                      width: 130,
                                      height: 50,
                                      child: ElevatedButton(
                                        onPressed: state.maybeWhen(
                                          loading: () => null,
                                          orElse: () => () {
                                            context.read<LoginBloc>().add(
                                              LoginButtonPressed(
                                                _idController.text,
                                                _passwordController.text,
                                              ),
                                            );
                                          },
                                        ),
                                        style: ButtonStyle(
                                          backgroundColor:
                                              WidgetStateProperty.all(
                                                colorScheme.primary,
                                              ),
                                          elevation: WidgetStateProperty.all(
                                            3.0,
                                          ),
                                          side: WidgetStateProperty.all(
                                            const BorderSide(
                                              color: Colors.black,
                                              width: 1.0,
                                            ),
                                          ),
                                        ),
                                        child: state.maybeWhen(
                                          loading: () =>
                                              const CircularProgressIndicator(
                                                color: Colors.white,
                                              ),
                                          orElse: () => Text(
                                            'Login',
                                            style: GoogleFonts.lexendDeca(
                                              textStyle: textScheme.titleMedium
                                                  ?.copyWith(
                                                    fontWeight:
                                                        CustomFontWeight.bold,
                                                    color: Colors.white,
                                                  ),
                                            ),
                                          ),
                                        ),
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsetsDirectional.fromSTEB(
                                0,
                                12,
                                0,
                                24,
                              ),
                              child: Row(
                                mainAxisSize: MainAxisSize.max,
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Padding(
                                    padding:
                                        const EdgeInsetsDirectional.fromSTEB(
                                          20,
                                          0,
                                          0,
                                          0,
                                        ),
                                    child: Text(
                                      'Don\'t have an account?',
                                      style: GoogleFonts.lexendDeca(
                                        textStyle: textScheme.bodyMedium,
                                        fontWeight: CustomFontWeight.normal,
                                        color: colorScheme.grayIcon,
                                        fontSize: 14,
                                        letterSpacing: 0.0,
                                      ),
                                    ),
                                  ),
                                  TextButton(
                                    onPressed: () =>
                                        context.go('/create_account'),
                                    child: SizedBox(
                                      width: 150,
                                      child: Text(
                                        'Create Account',
                                        textAlign: TextAlign.center,
                                        style: GoogleFonts.lexendDeca(
                                          textStyle: textScheme.titleSmall,
                                          fontWeight: CustomFontWeight.bold,
                                          fontSize: 14,
                                          letterSpacing: 0.0,
                                          color: colorScheme.turquoise,
                                        ),
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
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
