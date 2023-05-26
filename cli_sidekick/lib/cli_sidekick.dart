import 'dart:async';

import 'package:cli_sidekick/src/commands/clean_command.dart';
import 'package:cli_sidekick/src/commands/dockerize/docker_command.dart';
import 'package:sidekick_core/sidekick_core.dart';

Future<void> runCli(List<String> args) async {
  final runner = initializeSidekick(
    mainProjectPath: '.',
    flutterSdkPath: systemFlutterSdkPath(),
  );

  runner
    ..addCommand(FlutterCommand())
    ..addCommand(DartCommand())
    ..addCommand(DepsCommand())
    ..addCommand(CleanCommand())
    ..addCommand(DartAnalyzeCommand())
    ..addCommand(FormatCommand())
    ..addCommand(SidekickCommand())
    ..addCommand(DockerCommand());

  try {
    return await runner.run(args);
  } on UsageException catch (e) {
    print(e);
    exit(64); // usage error
  }
}
