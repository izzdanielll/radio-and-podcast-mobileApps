import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';
import '/backend/schema/util/schema_util.dart';

import 'index.dart';

class RadioRecord extends FirestoreRecord {
  RadioRecord._(
    super.reference,
    super.data,
  ) {
    _initializeFields();
  }

  // "name" field.
  String? _name;
  String get name => _name ?? '';
  bool hasName() => _name != null;

  // "image_url" field.
  String? _imageUrl;
  String get imageUrl => _imageUrl ?? '';
  bool hasImageUrl() => _imageUrl != null;

  // "is_favorites" field.
  bool? _isFavorites;
  bool get isFavorites => _isFavorites ?? false;
  bool hasIsFavorites() => _isFavorites != null;

  // "url" field.
  String? _url;
  String get url => _url ?? '';
  bool hasUrl() => _url != null;

  void _initializeFields() {
    _name = snapshotData['name'] as String?;
    _imageUrl = snapshotData['image_url'] as String?;
    _isFavorites = snapshotData['is_favorites'] as bool?;
    _url = snapshotData['url'] as String?;
  }

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('Radio');

  static Stream<RadioRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => RadioRecord.fromSnapshot(s));

  static Future<RadioRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then((s) => RadioRecord.fromSnapshot(s));

  static RadioRecord fromSnapshot(DocumentSnapshot snapshot) => RadioRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static RadioRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      RadioRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'RadioRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is RadioRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createRadioRecordData({
  String? name,
  String? imageUrl,
  bool? isFavorites,
  String? url,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'name': name,
      'image_url': imageUrl,
      'is_favorites': isFavorites,
      'url': url,
    }.withoutNulls,
  );

  return firestoreData;
}

class RadioRecordDocumentEquality implements Equality<RadioRecord> {
  const RadioRecordDocumentEquality();

  @override
  bool equals(RadioRecord? e1, RadioRecord? e2) {
    return e1?.name == e2?.name &&
        e1?.imageUrl == e2?.imageUrl &&
        e1?.isFavorites == e2?.isFavorites &&
        e1?.url == e2?.url;
  }

  @override
  int hash(RadioRecord? e) =>
      const ListEquality().hash([e?.name, e?.imageUrl, e?.isFavorites, e?.url]);

  @override
  bool isValidKey(Object? o) => o is RadioRecord;
}
