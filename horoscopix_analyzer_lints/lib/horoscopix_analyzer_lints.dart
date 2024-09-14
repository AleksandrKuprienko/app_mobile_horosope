import 'package:custom_lint_builder/custom_lint_builder.dart';
import 'package:horoscopix_analyzer_lints/src/horoscopix_analyzer_lints_base.dart';

PluginBase createPlugin() => _BeteasyPlugin();

class _BeteasyPlugin extends PluginBase {
  @override
  List<LintRule> getLintRules(CustomLintConfigs _) => [HoroscopixAvoidLogLint()];
}
