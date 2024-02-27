import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';
import '/backend/schema/util/schema_util.dart';

import 'index.dart';

class PodcastRecord extends FirestoreRecord {
  PodcastRecord._(
    super.reference,
    super.data,
  ) {
    _initializeFields();
  }

  // "banner_image" field.
  String? _bannerImage;
  String get bannerImage => _bannerImage ?? '';
  bool hasBannerImage() => _bannerImage != null;

  // "video" field.
  String? _video;
  String get video => _video ?? '';
  bool hasVideo() => _video != null;

  // "audio" field.
  String? _audio;
  String get audio => _audio ?? '';
  bool hasAudio() => _audio != null;

  // "thumbnail" field.
  String? _thumbnail;
  String get thumbnail => _thumbnail ?? '';
  bool hasThumbnail() => _thumbnail != null;

  // "title" field.
  String? _title;
  String get title => _title ?? '';
  bool hasTitle() => _title != null;

  // "description" field.
  String? _description;
  String get description => _description ?? '';
  bool hasDescription() => _description != null;

  void _initializeFields() {
    _bannerImage = snapshotData['banner_image'] as String?;
    _video = snapshotData['video'] as String?;
    _audio = snapshotData['audio'] as String?;
    _thumbnail = snapshotData['thumbnail'] as String?;
    _title = snapshotData['title'] as String?;
    _description = snapshotData['description'] as String?;
  }

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('Podcast');

  static Stream<PodcastRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => PodcastRecord.fromSnapshot(s));

  static Future<PodcastRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then((s) => PodcastRecord.fromSnapshot(s));

  static PodcastRecord fromSnapshot(DocumentSnapshot snapshot) =>
      PodcastRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static PodcastRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      PodcastRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'PodcastRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is PodcastRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createPodcastRecordData({
  String? bannerImage,
  String? video,
  String? audio,
  String? thumbnail,
  String? title,
  String? description,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'banner_image': bannerImage,
      'video': video,
      'audio': audio,
      'thumbnail': thumbnail,
      'title': title,
      'description': description,
    }.withoutNulls,
  );

  return firestoreData;
}

class PodcastRecordDocumentEquality implements Equality<PodcastRecord> {
  const PodcastRecordDocumentEquality();

  @override
  bool equals(PodcastRecord? e1, PodcastRecord? e2) {
    return e1?.bannerImage == e2?.bannerImage &&
        e1?.video == e2?.video &&
        e1?.audio == e2?.audio &&
        e1?.thumbnail == e2?.thumbnail &&
        e1?.title == e2?.title &&
        e1?.description == e2?.description;
  }

  @override
  int hash(PodcastRecord? e) => const ListEquality().hash([
        e?.bannerImage,
        e?.video,
        e?.audio,
        e?.thumbnail,
        e?.title,
        e?.description
      ]);

  @override
  bool isValidKey(Object? o) => o is PodcastRecord;
}
