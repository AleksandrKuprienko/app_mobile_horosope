// ignore_for_file: deprecated_member_use

import 'package:analyzer/error/error.dart' as error;
import 'package:analyzer/error/listener.dart';
import 'package:custom_lint_builder/custom_lint_builder.dart';

class HoroscopixAvoidLogLint extends DartLintRule {
  HoroscopixAvoidLogLint() : super(code: _code);

  static const _code = LintCode(
    name: 'avoid_log',
    problemMessage: 'Don\'t invoke \'log\' in production code',
    correctionMessage: 'Try using a logging framework.',
    errorSeverity: error.ErrorSeverity.INFO,
  );

  @override
  void run(
    CustomLintResolver resolver,
    ErrorReporter reporter,
    CustomLintContext context,
  ) {
    context.registry.addMethodInvocation((node) {
      if (node.methodName.name == 'log') {
        reporter.reportErrorForNode(
          _code,
          node,
        );
      }
    });
  }
}
