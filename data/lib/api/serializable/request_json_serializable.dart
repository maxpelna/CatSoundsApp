import 'package:json_annotation/json_annotation.dart';

class RequestJsonSerializable extends JsonSerializable {
  const RequestJsonSerializable({
    super.anyMap,
    super.checked,
    super.constructor,
    super.createFieldMap,
    super.createFactory = false,
    super.createToJson = true,
    super.disallowUnrecognizedKeys,
    super.explicitToJson = true,
    super.fieldRename = FieldRename.snake,
    super.ignoreUnannotated,
    super.includeIfNull = false,
    super.genericArgumentFactories,
    super.createPerFieldToJson,
  });
}
