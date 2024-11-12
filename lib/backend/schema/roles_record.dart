import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class RolesRecord extends FirestoreRecord {
  RolesRecord._(
    super.reference,
    super.data,
  ) {
    _initializeFields();
  }

  // "nombreDelRol" field.
  String? _nombreDelRol;
  String get nombreDelRol => _nombreDelRol ?? '';
  bool hasNombreDelRol() => _nombreDelRol != null;

  // "privilegio" field.
  List<PrivilegiosStruct>? _privilegio;
  List<PrivilegiosStruct> get privilegio => _privilegio ?? const [];
  bool hasPrivilegio() => _privilegio != null;

  void _initializeFields() {
    _nombreDelRol = snapshotData['nombreDelRol'] as String?;
    _privilegio = getStructList(
      snapshotData['privilegio'],
      PrivilegiosStruct.fromMap,
    );
  }

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('roles');

  static Stream<RolesRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => RolesRecord.fromSnapshot(s));

  static Future<RolesRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then((s) => RolesRecord.fromSnapshot(s));

  static RolesRecord fromSnapshot(DocumentSnapshot snapshot) => RolesRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static RolesRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      RolesRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'RolesRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is RolesRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createRolesRecordData({
  String? nombreDelRol,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'nombreDelRol': nombreDelRol,
    }.withoutNulls,
  );

  return firestoreData;
}

class RolesRecordDocumentEquality implements Equality<RolesRecord> {
  const RolesRecordDocumentEquality();

  @override
  bool equals(RolesRecord? e1, RolesRecord? e2) {
    const listEquality = ListEquality();
    return e1?.nombreDelRol == e2?.nombreDelRol &&
        listEquality.equals(e1?.privilegio, e2?.privilegio);
  }

  @override
  int hash(RolesRecord? e) =>
      const ListEquality().hash([e?.nombreDelRol, e?.privilegio]);

  @override
  bool isValidKey(Object? o) => o is RolesRecord;
}
