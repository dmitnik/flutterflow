import 'dart:async';

import 'index.dart';
import 'serializers.dart';
import 'package:built_value/built_value.dart';

part 'ads_record.g.dart';

abstract class AdsRecord implements Built<AdsRecord, AdsRecordBuilder> {
  static Serializer<AdsRecord> get serializer => _$adsRecordSerializer;

  @nullable
  @BuiltValueField(wireName: 'ad_image')
  String get adImage;

  @nullable
  @BuiltValueField(wireName: 'ad_item')
  String get adItem;

  @nullable
  @BuiltValueField(wireName: 'ad_gifts_amount')
  int get adGiftsAmount;

  @nullable
  @BuiltValueField(wireName: 'created_by')
  DocumentReference get createdBy;

  @nullable
  @BuiltValueField(wireName: 'activating_date')
  DateTime get activatingDate;

  @nullable
  @BuiltValueField(wireName: 'owning_store')
  DocumentReference get owningStore;

  @nullable
  @BuiltValueField(wireName: 'have_collected')
  BuiltList<DocumentReference> get haveCollected;

  @nullable
  @BuiltValueField(wireName: kDocumentReferenceField)
  DocumentReference get reference;

  static void _initializeBuilder(AdsRecordBuilder builder) => builder
    ..adImage = ''
    ..adItem = ''
    ..adGiftsAmount = 0
    ..haveCollected = ListBuilder();

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
  String adImage,
  String adItem,
  int adGiftsAmount,
  DocumentReference createdBy,
  DateTime activatingDate,
  DocumentReference owningStore,
}) =>
    serializers.toFirestore(
        AdsRecord.serializer,
        AdsRecord((a) => a
          ..adImage = adImage
          ..adItem = adItem
          ..adGiftsAmount = adGiftsAmount
          ..createdBy = createdBy
          ..activatingDate = activatingDate
          ..owningStore = owningStore
          ..haveCollected = null));
