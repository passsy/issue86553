import 'package:sidekick_core/sidekick_core.dart';


import 'package:cli_sidekick/src/commands/dockerize/build_commands/build_app_command.dart';
import 'package:cli_sidekick/src/commands/dockerize/build_commands/build_image_command.dart';
import 'package:cli_sidekick/src/commands/dockerize/environment.dart';

class BuildCommand extends Command {
  @override
  String get description => 'Builds a docker image for your Flutter Web App';

  @override
  String get name => 'build';

  final Set<DockerizeEnvironment> _environments = DockerizeEnvironments.all;

  BuildCommand() {
    addSubcommand(BuildImageCommand());
    addSubcommand(BuildAppCommand());
    argParser.addOption(
      'env',
      allowed: _environments.map((it) => it.name),
      help: 'The environment to build the docker image for',
    );
  }
}