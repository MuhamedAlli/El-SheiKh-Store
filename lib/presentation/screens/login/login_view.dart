import 'package:elsheikh_store/app/dependancy_injection.dart';
import 'package:elsheikh_store/presentation/business_logic/bloc/login_bloc/login_bloc.dart';
import 'package:elsheikh_store/presentation/resources/assets_manager.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:formz/formz.dart';

import '../../resources/routes_manager.dart';

class LoginView extends StatelessWidget {
  const LoginView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: BlocProvider(
          create: (context) => LoginBloc(loginUseCase: instance()),
          child: const LoginForm(),
        ),
      ),
    );
  }
}

class LoginForm extends StatelessWidget {
  const LoginForm({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocListener<LoginBloc, LoginState>(
      listener: ((context, state) {
        if (state.status.isSubmissionFailure) {
          Navigator.of(context).pop();
          ScaffoldMessenger.of(context)
            ..hideCurrentSnackBar()
            ..showSnackBar(
              const SnackBar(
                content: Text('Authentication Failure'),
              ),
            );
        } else if (state.status.isSubmissionSuccess) {
          Navigator.of(context).pushNamed(Routes.mainRoute);
        } else if (state.status.isSubmissionInProgress) {
          showLoaderDialog(context);
        }
      }),
      child: Padding(
        padding: const EdgeInsets.only(left: 10, right: 10),
        child: Column(
            mainAxisSize: MainAxisSize.max,
            mainAxisAlignment: MainAxisAlignment.center,
            children: const [
              _LogoWidget(),
              SizedBox(
                height: 40,
              ),
              _UsernameInputWidget(),
              SizedBox(
                height: 20,
              ),
              _PasswordInputWidget(),
              SizedBox(
                height: 30,
              ),
              _LoginButtonWidget(),
            ]),
      ),
    );
  }

  showLoaderDialog(BuildContext context) {
    AlertDialog alert = AlertDialog(
      content: Row(
        children: [
          const CircularProgressIndicator(),
          Container(
              margin: const EdgeInsets.only(left: 7),
              child: const Text("Loading...")),
        ],
      ),
    );
    showDialog(
      barrierDismissible: false,
      context: context,
      builder: (BuildContext context) {
        return alert;
      },
    );
  }
}

class _LogoWidget extends StatelessWidget {
  const _LogoWidget();

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 150,
      width: 150,
      child: Image.asset(ImageAssets.logo),
    );
  }
}

class _UsernameInputWidget extends StatelessWidget {
  const _UsernameInputWidget();

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<LoginBloc, LoginState>(
      buildWhen: ((previous, current) => previous.username != current.username),
      builder: ((context, state) {
        return TextField(
          key: const Key('loginForm_usernameInput_textField'),
          decoration: InputDecoration(
            hintText: 'Username',
            errorText: state.username.invalid ? "invalid username" : null,
          ),
          onChanged: (username) {
            BlocProvider.of<LoginBloc>(context)
                .add(LoginUsernameChanged(username));
          },
        );
      }),
    );
  }
}

class _PasswordInputWidget extends StatelessWidget {
  const _PasswordInputWidget();

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<LoginBloc, LoginState>(
      buildWhen: ((previous, current) => previous.password != current.password),
      builder: ((context, state) {
        return TextField(
          key: const Key('loginForm_passwordInput_textField'),
          decoration: InputDecoration(
            hintText: 'Password',
            errorText: state.password.invalid ? "invalid password" : null,
          ),
          onChanged: (password) {
            BlocProvider.of<LoginBloc>(context)
                .add(LoginPasswordChanged(password));
          },
        );
      }),
    );
  }
}

class _LoginButtonWidget extends StatelessWidget {
  const _LoginButtonWidget();
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<LoginBloc, LoginState>(
      buildWhen: (previous, current) => previous.status != current.status,
      builder: (context, state) {
        return SizedBox(
          width: double.infinity,
          height: 40,
          child: ElevatedButton(
            key: const Key('loginForm_continue_raisedButton'),
            onPressed: state.status.isValidated
                ? () {
                    BlocProvider.of<LoginBloc>(context)
                        .add(const LoginSubmitted());
                  }
                : null,
            child: const Text('Login'),
          ),
        );
      },
    );
  }
}
