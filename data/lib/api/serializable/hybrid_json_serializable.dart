import 'package:json_annotation/json_annotation.dart';

class HybridJsonSerializable extends JsonSerializable {
  const HybridJsonSerializable({
    super.anyMap,
    super.checked,
    super.constructor,
    super.createFieldMap,
    super.createFactory = true,
    super.createToJson = true,
    super.disallowUnrecognizedKeys,
    super.explicitToJson = true,
    super.fieldRename = FieldRename.snake,
    super.ignoreUnannotated,
    super.includeIfNull,
    super.genericArgumentFactories,
    super.createPerFieldToJson,
  });
}
