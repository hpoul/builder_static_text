import 'dart:async';

import 'package:build/build.dart';
import 'package:source_gen/source_gen.dart';

class StaticTextGenerator extends Generator {
  StaticTextGenerator(this.content);

  final String content;

  @override
  FutureOr<String> generate(LibraryReader library, BuildStep buildStep) => content;
}

Builder staticTextBuilder(BuilderOptions options) => SharedPartBuilder(
      [
        StaticTextGenerator(options.config['content'] as String ?? '// modify build.yaml to configure this text.'),
      ],
      'static_text',
    );
