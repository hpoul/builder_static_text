# builder_static_text

A simple way to add static text to generated source files (`hello.g.dart`).

The only reason for it's existence is that

1. json_serialize does not produce code valid for strong mode implicity-dynamic: false
   https://github.com/dart-lang/json_serializable/issues/247
2. analysis_options.yml exclude does not work correctly
   https://github.com/dart-lang/linter/issues/320 https://github.com/dart-lang/sdk/issues/34069
3. source_gen does not provide a header/footer option on it's own
   https://github.com/dart-lang/source_gen/issues/370
   

## Getting Started

Add to `pubspec.yaml`

```yaml
dev_dependency:
  builder_static_text: ^0.0.1

```

Create `build.yaml` and configure the builder:

```yaml
targets:
  $default:
    builders:
      builder_static_text|static_text:
        generate_for:
          - lib/**/*.dart
        options:
          content: '// ignore_for_file: strong_mode_implicit_dynamic_parameter'
```
