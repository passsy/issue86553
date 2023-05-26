import 'package:dockerize_sidekick_plugin/dockerize_sidekick_plugin.dart';
import 'package:sidekick_core/sidekick_core.dart';

import 'package:cli_sidekick/src/commands/dockerize/build_commands/build_command.dart';
import 'package:cli_sidekick/src/commands/dockerize/run_command.dart';
import 'package:cli_sidekick/src/commands/dockerize/stop_command.dart';

class DockerCommand extends Command {
  @override
  String get description => 'Manage all the docker related commands';

  @override
  String get name => 'docker';

  DockerCommand() {
    addSubcommand(BuildCommand());
    addSubcommand(RunCommand());
    addSubcommand(StopCommand());
  }

  @override
  String get usage => printUsage(SidekickContext.cliName);
}