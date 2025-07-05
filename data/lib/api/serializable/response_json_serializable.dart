import 'package:json_annotation/json_annotation.dart';

class ResponseJsonSerializable extends JsonSerializable {
  const ResponseJsonSerializable({
    super.anyMap,
    super.checked,
    super.constructor,
    super.createFieldMap,
    super.createFactory = true,
    super.createToJson = false,
    super.disallowUnrecognizedKeys,
    super.explicitToJson = true,
    super.fieldRename = FieldRename.snake,
    super.ignoreUnannotated,
    super.includeIfNull,
    super.genericArgumentFactories,
    super.createPerFieldToJson,
  });
}
