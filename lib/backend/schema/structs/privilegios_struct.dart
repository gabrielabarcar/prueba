// ignore_for_file: unnecessary_getters_setters

import 'package:cloud_firestore/cloud_firestore.dart';

import '/backend/schema/util/firestore_util.dart';

import '/flutter_flow/flutter_flow_util.dart';

class PrivilegiosStruct extends FFFirebaseStruct {
  PrivilegiosStruct({
    bool? estado,
    String? nombrePrivilegios,
    FirestoreUtilData firestoreUtilData = const FirestoreUtilData(),
  })  : _estado = estado,
        _nombrePrivilegios = nombrePrivilegios,
        super(firestoreUtilData);

  // "estado" field.
  bool? _estado;
  bool get estado => _estado ?? false;
  set estado(bool? val) => _estado = val;

  bool hasEstado() => _estado != null;

  // "nombrePrivilegios" field.
  String? _nombrePrivilegios;
  String get nombrePrivilegios => _nombrePrivilegios ?? '';
  set nombrePrivilegios(String? val) => _nombrePrivilegios = val;

  bool hasNombrePrivilegios() => _nombrePrivilegios != null;

  static PrivilegiosStruct fromMap(Map<String, dynamic> data) =>
      PrivilegiosStruct(
        estado: data['estado'] as bool?,
        nombrePrivilegios: data['nombrePrivilegios'] as String?,
      );

  static PrivilegiosStruct? maybeFromMap(dynamic data) => data is Map
      ? PrivilegiosStruct.fromMap(data.cast<String, dynamic>())
      : null;

  Map<String, dynamic> toMap() => {
        'estado': _estado,
        'nombrePrivilegios': _nombrePrivilegios,
      }.withoutNulls;

  @override
  Map<String, dynamic> toSerializableMap() => {
        'estado': serializeParam(
          _estado,
          ParamType.bool,
        ),
        'nombrePrivilegios': serializeParam(
          _nombrePrivilegios,
          ParamType.String,
        ),
      }.withoutNulls;

  static PrivilegiosStruct fromSerializableMap(Map<String, dynamic> data) =>
      PrivilegiosStruct(
        estado: deserializeParam(
          data['estado'],
          ParamType.bool,
          false,
        ),
        nombrePrivilegios: deserializeParam(
          data['nombrePrivilegios'],
          ParamType.String,
          false,
        ),
      );

  @override
  String toString() => 'PrivilegiosStruct(${toMap()})';

  @override
  bool operator ==(Object other) {
    return other is PrivilegiosStruct &&
        estado == other.estado &&
        nombrePrivilegios == other.nombrePrivilegios;
  }

  @override
  int get hashCode => const ListEquality().hash([estado, nombrePrivilegios]);
}

PrivilegiosStruct createPrivilegiosStruct({
  bool? estado,
  String? nombrePrivilegios,
  Map<String, dynamic> fieldValues = const {},
  bool clearUnsetFields = true,
  bool create = false,
  bool delete = false,
}) =>
    PrivilegiosStruct(
      estado: estado,
      nombrePrivilegios: nombrePrivilegios,
      firestoreUtilData: FirestoreUtilData(
        clearUnsetFields: clearUnsetFields,
        create: create,
        delete: delete,
        fieldValues: fieldValues,
      ),
    );

PrivilegiosStruct? updatePrivilegiosStruct(
  PrivilegiosStruct? privilegios, {
  bool clearUnsetFields = true,
  bool create = false,
}) =>
    privilegios
      ?..firestoreUtilData = FirestoreUtilData(
        clearUnsetFields: clearUnsetFields,
        create: create,
      );

void addPrivilegiosStructData(
  Map<String, dynamic> firestoreData,
  PrivilegiosStruct? privilegios,
  String fieldName, [
  bool forFieldValue = false,
]) {
  firestoreData.remove(fieldName);
  if (privilegios == null) {
    return;
  }
  if (privilegios.firestoreUtilData.delete) {
    firestoreData[fieldName] = FieldValue.delete();
    return;
  }
  final clearFields =
      !forFieldValue && privilegios.firestoreUtilData.clearUnsetFields;
  if (clearFields) {
    firestoreData[fieldName] = <String, dynamic>{};
  }
  final privilegiosData =
      getPrivilegiosFirestoreData(privilegios, forFieldValue);
  final nestedData =
      privilegiosData.map((k, v) => MapEntry('$fieldName.$k', v));

  final mergeFields = privilegios.firestoreUtilData.create || clearFields;
  firestoreData
      .addAll(mergeFields ? mergeNestedFields(nestedData) : nestedData);
}

Map<String, dynamic> getPrivilegiosFirestoreData(
  PrivilegiosStruct? privilegios, [
  bool forFieldValue = false,
]) {
  if (privilegios == null) {
    return {};
  }
  final firestoreData = mapToFirestore(privilegios.toMap());

  // Add any Firestore field values
  privilegios.firestoreUtilData.fieldValues
      .forEach((k, v) => firestoreData[k] = v);

  return forFieldValue ? mergeNestedFields(firestoreData) : firestoreData;
}

List<Map<String, dynamic>> getPrivilegiosListFirestoreData(
  List<PrivilegiosStruct>? privilegioss,
) =>
    privilegioss?.map((e) => getPrivilegiosFirestoreData(e, true)).toList() ??
    [];
