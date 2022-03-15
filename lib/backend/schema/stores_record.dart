import 'dart:async';

import 'index.dart';
import 'serializers.dart';
import 'package:built_value/built_value.dart';

part 'stores_record.g.dart';

abstract class StoresRecord
    implements Built<StoresRecord, StoresRecordBuilder> {
  static Serializer<StoresRecord> get serializer => _$storesRecordSerializer;

  @nullable
  @BuiltValueField(wireName: 'store_name')
  String get storeName;

  @nullable
  @BuiltValueField(wireName: 'store_address')
  String get storeAddress;

  @nullable
  @BuiltValueField(wireName: 'store_location')
  LatLng get storeLocation;

  @nullable
  @BuiltValueField(wireName: 'store_photos')
  BuiltList<String> get storePhotos;

  @nullable
  @BuiltValueField(wireName: 'store_description')
  String get storeDescription;

  @nullable
  @BuiltValueField(wireName: 'store_owner')
  DocumentReference get storeOwner;

  @nullable
  @BuiltValueField(wireName: 'store_city')
  String get storeCity;

  @nullable
  @BuiltValueField(wireName: 'store_street')
  String get storeStreet;

  @nullable
  @BuiltValueField(wireName: 'store_country')
  String get storeCountry;

  @nullable
  @BuiltValueField(wireName: kDocumentReferenceField)
  DocumentReference get reference;

  static void _initializeBuilder(StoresRecordBuilder builder) => builder
    ..storeName = ''
    ..storeAddress = ''
    ..storePhotos = ListBuilder()
    ..storeDescription = ''
    ..storeCity = ''
    ..storeStreet = ''
    ..storeCountry = '';

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
  String storeName,
  String storeAddress,
  LatLng storeLocation,
  String storeDescription,
  DocumentReference storeOwner,
  String storeCity,
  String storeStreet,
  String storeCountry,
}) =>
    serializers.toFirestore(
        StoresRecord.serializer,
        StoresRecord((s) => s
          ..storeName = storeName
          ..storeAddress = storeAddress
          ..storeLocation = storeLocation
          ..storePhotos = null
          ..storeDescription = storeDescription
          ..storeOwner = storeOwner
          ..storeCity = storeCity
          ..storeStreet = storeStreet
          ..storeCountry = storeCountry));
