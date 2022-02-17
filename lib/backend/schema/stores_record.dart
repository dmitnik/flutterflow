import 'dart:async';

import 'index.dart';
import 'serializers.dart';
import 'package:built_value/built_value.dart';

part 'stores_record.g.dart';

abstract class StoresRecord
    implements Built<StoresRecord, StoresRecordBuilder> {
  static Serializer<StoresRecord> get serializer => _$storesRecordSerializer;

  @nullable
  String get name;

  @nullable
  DocumentReference get owner;

  @nullable
  @BuiltValueField(wireName: 'store_ads')
  BuiltList<DocumentReference> get storeAds;

  @nullable
  @BuiltValueField(wireName: 'store_address')
  String get storeAddress;

  @nullable
  @BuiltValueField(wireName: 'store_location')
  LatLng get storeLocation;

  @nullable
  @BuiltValueField(wireName: kDocumentReferenceField)
  DocumentReference get reference;

  static void _initializeBuilder(StoresRecordBuilder builder) => builder
    ..name = ''
    ..storeAds = ListBuilder()
    ..storeAddress = '';

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('stores');

  static Stream<StoresRecord> getDocument(DocumentReference ref) => ref
      .snapshots()
      .map((s) => serializers.deserializeWith(serializer, serializedData(s)));

  static Future<StoresRecord> getDocumentOnce(DocumentReference ref) => ref
      .get()
      .then((s) => serializers.deserializeWith(serializer, serializedData(s)));

  StoresRecord._();
  factory StoresRecord([void Function(StoresRecordBuilder) updates]) =
      _$StoresRecord;

  static StoresRecord getDocumentFromData(
          Map<String, dynamic> data, DocumentReference reference) =>
      serializers.deserializeWith(serializer,
          {...mapFromFirestore(data), kDocumentReferenceField: reference});
}

Map<String, dynamic> createStoresRecordData({
  String name,
  DocumentReference owner,
  String storeAddress,
  LatLng storeLocation,
}) =>
    serializers.toFirestore(
        StoresRecord.serializer,
        StoresRecord((s) => s
          ..name = name
          ..owner = owner
          ..storeAds = null
          ..storeAddress = storeAddress
          ..storeLocation = storeLocation));
