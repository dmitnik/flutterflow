import 'dart:async';

import 'index.dart';
import 'serializers.dart';
import 'package:built_value/built_value.dart';

part 'ads_record.g.dart';

abstract class AdsRecord implements Built<AdsRecord, AdsRecordBuilder> {
  static Serializer<AdsRecord> get serializer => _$adsRecordSerializer;

  @nullable
  @BuiltValueField(wireName: 'store_name')
  String get storeName;

  @nullable
  @BuiltValueField(wireName: 'ad_image')
  String get adImage;

  @nullable
  @BuiltValueField(wireName: 'ad_item')
  String get adItem;

  @nullable
  @BuiltValueField(wireName: 'ad_location')
  LatLng get adLocation;

  @nullable
  @BuiltValueField(wireName: 'ad_gifts_amount')
  int get adGiftsAmount;

  @nullable
  @BuiltValueField(wireName: 'ad_address')
  String get adAddress;

  @nullable
  @BuiltValueField(wireName: 'created_by')
  DocumentReference get createdBy;

  @nullable
  @BuiltValueField(wireName: 'activating_date')
  DateTime get activatingDate;

  @nullable
  @BuiltValueField(wireName: kDocumentReferenceField)
  DocumentReference get reference;

  static void _initializeBuilder(AdsRecordBuilder builder) => builder
    ..storeName = ''
    ..adImage = ''
    ..adItem = ''
    ..adGiftsAmount = 0
    ..adAddress = '';

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('ads');

  static Stream<AdsRecord> getDocument(DocumentReference ref) => ref
      .snapshots()
      .map((s) => serializers.deserializeWith(serializer, serializedData(s)));

  static Future<AdsRecord> getDocumentOnce(DocumentReference ref) => ref
      .get()
      .then((s) => serializers.deserializeWith(serializer, serializedData(s)));

  AdsRecord._();
  factory AdsRecord([void Function(AdsRecordBuilder) updates]) = _$AdsRecord;

  static AdsRecord getDocumentFromData(
          Map<String, dynamic> data, DocumentReference reference) =>
      serializers.deserializeWith(serializer,
          {...mapFromFirestore(data), kDocumentReferenceField: reference});
}

Map<String, dynamic> createAdsRecordData({
  String storeName,
  String adImage,
  String adItem,
  LatLng adLocation,
  int adGiftsAmount,
  String adAddress,
  DocumentReference createdBy,
  DateTime activatingDate,
}) =>
    serializers.toFirestore(
        AdsRecord.serializer,
        AdsRecord((a) => a
          ..storeName = storeName
          ..adImage = adImage
          ..adItem = adItem
          ..adLocation = adLocation
          ..adGiftsAmount = adGiftsAmount
          ..adAddress = adAddress
          ..createdBy = createdBy
          ..activatingDate = activatingDate));
