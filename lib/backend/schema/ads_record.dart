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
  @BuiltValueField(wireName: 'ad_items_ammount')
  int get adItemsAmmount;

  @nullable
  @BuiltValueField(wireName: 'ad_have_collected')
  BuiltList<DocumentReference> get adHaveCollected;

  @nullable
  @BuiltValueField(wireName: 'ad_activating_date')
  DateTime get adActivatingDate;

  @nullable
  @BuiltValueField(wireName: 'ad_tags')
  BuiltList<String> get adTags;

  @nullable
  @BuiltValueField(wireName: 'ad_item')
  String get adItem;

  @nullable
  @BuiltValueField(wireName: 'ad_owner')
  DocumentReference get adOwner;

  @nullable
  @BuiltValueField(wireName: 'ad_owning_stores')
  BuiltList<DocumentReference> get adOwningStores;

  @nullable
  @BuiltValueField(wireName: kDocumentReferenceField)
  DocumentReference get reference;

  static void _initializeBuilder(AdsRecordBuilder builder) => builder
    ..adImage = ''
    ..adItemsAmmount = 0
    ..adHaveCollected = ListBuilder()
    ..adTags = ListBuilder()
    ..adItem = ''
    ..adOwningStores = ListBuilder();

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
  int adItemsAmmount,
  DateTime adActivatingDate,
  String adItem,
  DocumentReference adOwner,
}) =>
    serializers.toFirestore(
        AdsRecord.serializer,
        AdsRecord((a) => a
          ..adImage = adImage
          ..adItemsAmmount = adItemsAmmount
          ..adHaveCollected = null
          ..adActivatingDate = adActivatingDate
          ..adTags = null
          ..adItem = adItem
          ..adOwner = adOwner
          ..adOwningStores = null));
