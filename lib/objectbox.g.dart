// GENERATED CODE - DO NOT MODIFY BY HAND
// This code was generated by ObjectBox. To update it run the generator again:
// With a Flutter package, run `flutter pub run build_runner build`.
// With a Dart package, run `dart run build_runner build`.
// See also https://docs.objectbox.io/getting-started#generate-objectbox-code

// ignore_for_file: camel_case_types
// coverage:ignore-file

import 'dart:typed_data';

import 'package:flat_buffers/flat_buffers.dart' as fb;
import 'package:objectbox/internal.dart'; // generated code can access "internal" functionality
import 'package:objectbox/objectbox.dart';
import 'package:objectbox_flutter_libs/objectbox_flutter_libs.dart';

import 'model/homework.dart';
import 'model/progress.dart';
import 'model/vacation_period.dart';

export 'package:objectbox/objectbox.dart'; // so that callers only have to import this file

final _entities = <ModelEntity>[
  ModelEntity(
      id: const IdUid(1, 7416538436566344744),
      name: 'Homework',
      lastPropertyId: const IdUid(3, 4791172100840693595),
      flags: 0,
      properties: <ModelProperty>[
        ModelProperty(
            id: const IdUid(1, 3129675219010325285),
            name: 'id',
            type: 6,
            flags: 1),
        ModelProperty(
            id: const IdUid(2, 4722468817945567841),
            name: 'subject',
            type: 9,
            flags: 0),
        ModelProperty(
            id: const IdUid(3, 4791172100840693595),
            name: 'homeworkType',
            type: 6,
            flags: 0)
      ],
      relations: <ModelRelation>[],
      backlinks: <ModelBacklink>[]),
  ModelEntity(
      id: const IdUid(2, 5037503503231369054),
      name: 'Progress',
      lastPropertyId: const IdUid(4, 2680886351427564234),
      flags: 0,
      properties: <ModelProperty>[
        ModelProperty(
            id: const IdUid(1, 1738934567779255837),
            name: 'id',
            type: 6,
            flags: 1),
        ModelProperty(
            id: const IdUid(2, 8652132213613752046),
            name: 'homeworkId',
            type: 6,
            flags: 0),
        ModelProperty(
            id: const IdUid(3, 6437986096626632288),
            name: 'total',
            type: 6,
            flags: 0),
        ModelProperty(
            id: const IdUid(4, 2680886351427564234),
            name: 'done',
            type: 6,
            flags: 0)
      ],
      relations: <ModelRelation>[],
      backlinks: <ModelBacklink>[]),
  ModelEntity(
      id: const IdUid(3, 4580867874821155882),
      name: 'Weather',
      lastPropertyId: const IdUid(3, 3555593146566625753),
      flags: 0,
      properties: <ModelProperty>[
        ModelProperty(
            id: const IdUid(1, 6693214501218201349),
            name: 'id',
            type: 6,
            flags: 1),
        ModelProperty(
            id: const IdUid(2, 6965383958094302565),
            name: 'weatherType',
            type: 6,
            flags: 0),
        ModelProperty(
            id: const IdUid(3, 3555593146566625753),
            name: 'date',
            type: 10,
            flags: 0)
      ],
      relations: <ModelRelation>[],
      backlinks: <ModelBacklink>[]),
  ModelEntity(
      id: const IdUid(4, 7152049473399866916),
      name: 'VacationPeriod',
      lastPropertyId: const IdUid(3, 8073381209560686703),
      flags: 0,
      properties: <ModelProperty>[
        ModelProperty(
            id: const IdUid(1, 8087034326838057250),
            name: 'id',
            type: 6,
            flags: 1),
        ModelProperty(
            id: const IdUid(2, 5800907435810813665),
            name: 'startDate',
            type: 10,
            flags: 0),
        ModelProperty(
            id: const IdUid(3, 8073381209560686703),
            name: 'endDate',
            type: 10,
            flags: 0)
      ],
      relations: <ModelRelation>[],
      backlinks: <ModelBacklink>[])
];

/// Open an ObjectBox store with the model declared in this file.
Future<Store> openStore(
        {String? directory,
        int? maxDBSizeInKB,
        int? fileMode,
        int? maxReaders,
        bool queriesCaseSensitiveDefault = true,
        String? macosApplicationGroup}) async =>
    Store(getObjectBoxModel(),
        directory: directory ?? (await defaultStoreDirectory()).path,
        maxDBSizeInKB: maxDBSizeInKB,
        fileMode: fileMode,
        maxReaders: maxReaders,
        queriesCaseSensitiveDefault: queriesCaseSensitiveDefault,
        macosApplicationGroup: macosApplicationGroup);

/// ObjectBox model definition, pass it to [Store] - Store(getObjectBoxModel())
ModelDefinition getObjectBoxModel() {
  final model = ModelInfo(
      entities: _entities,
      lastEntityId: const IdUid(4, 7152049473399866916),
      lastIndexId: const IdUid(0, 0),
      lastRelationId: const IdUid(0, 0),
      lastSequenceId: const IdUid(0, 0),
      retiredEntityUids: const [],
      retiredIndexUids: const [],
      retiredPropertyUids: const [],
      retiredRelationUids: const [],
      modelVersion: 5,
      modelVersionParserMinimum: 5,
      version: 1);

  final bindings = <Type, EntityDefinition>{
    Homework: EntityDefinition<Homework>(
        model: _entities[0],
        toOneRelations: (Homework object) => [],
        toManyRelations: (Homework object) => {},
        getId: (Homework object) => object.id,
        setId: (Homework object, int id) {
          object.id = id;
        },
        objectToFB: (Homework object, fb.Builder fbb) {
          final subjectOffset = fbb.writeString(object.subject);
          fbb.startTable(4);
          fbb.addInt64(0, object.id);
          fbb.addOffset(1, subjectOffset);
          fbb.addInt64(2, object.homeworkType);
          fbb.finish(fbb.endTable());
          return object.id;
        },
        objectFromFB: (Store store, ByteData fbData) {
          final buffer = fb.BufferContext(fbData);
          final rootOffset = buffer.derefObject(0);

          final object = Homework(
              id: const fb.Int64Reader().vTableGet(buffer, rootOffset, 4, 0),
              subject: const fb.StringReader(asciiOptimization: true)
                  .vTableGet(buffer, rootOffset, 6, ''),
              homeworkType:
                  const fb.Int64Reader().vTableGet(buffer, rootOffset, 8, 0));

          return object;
        }),
    Progress: EntityDefinition<Progress>(
        model: _entities[1],
        toOneRelations: (Progress object) => [],
        toManyRelations: (Progress object) => {},
        getId: (Progress object) => object.id,
        setId: (Progress object, int id) {
          object.id = id;
        },
        objectToFB: (Progress object, fb.Builder fbb) {
          fbb.startTable(5);
          fbb.addInt64(0, object.id);
          fbb.addInt64(1, object.homeworkId);
          fbb.addInt64(2, object.total);
          fbb.addInt64(3, object.completed);
          fbb.finish(fbb.endTable());
          return object.id;
        },
        objectFromFB: (Store store, ByteData fbData) {
          final buffer = fb.BufferContext(fbData);
          final rootOffset = buffer.derefObject(0);

          final object = Progress(
              id: const fb.Int64Reader().vTableGet(buffer, rootOffset, 4, 0),
              homeworkId:
                  const fb.Int64Reader().vTableGet(buffer, rootOffset, 6, 0),
              total: const fb.Int64Reader().vTableGet(buffer, rootOffset, 8, 0),
              completed:
                  const fb.Int64Reader().vTableGet(buffer, rootOffset, 10, 0));

          return object;
        }),
    VacationPeriod: EntityDefinition<VacationPeriod>(
        model: _entities[3],
        toOneRelations: (VacationPeriod object) => [],
        toManyRelations: (VacationPeriod object) => {},
        getId: (VacationPeriod object) => object.id,
        setId: (VacationPeriod object, int id) {
          object.id = id;
        },
        objectToFB: (VacationPeriod object, fb.Builder fbb) {
          fbb.startTable(4);
          fbb.addInt64(0, object.id);
          fbb.addInt64(1, object.startDate.millisecondsSinceEpoch);
          fbb.addInt64(2, object.endDate.millisecondsSinceEpoch);
          fbb.finish(fbb.endTable());
          return object.id;
        },
        objectFromFB: (Store store, ByteData fbData) {
          final buffer = fb.BufferContext(fbData);
          final rootOffset = buffer.derefObject(0);

          final object = VacationPeriod(
              id: const fb.Int64Reader().vTableGet(buffer, rootOffset, 4, 0),
              startDate: DateTime.fromMillisecondsSinceEpoch(
                  const fb.Int64Reader().vTableGet(buffer, rootOffset, 6, 0)),
              endDate: DateTime.fromMillisecondsSinceEpoch(
                  const fb.Int64Reader().vTableGet(buffer, rootOffset, 8, 0)));

          return object;
        })
  };

  return ModelDefinition(model, bindings);
}

/// [Homework] entity fields to define ObjectBox queries.
class Homework_ {
  /// see [Homework.id]
  static final id = QueryIntegerProperty<Homework>(_entities[0].properties[0]);

  /// see [Homework.subject]
  static final subject =
      QueryStringProperty<Homework>(_entities[0].properties[1]);

  /// see [Homework.homeworkType]
  static final homeworkType =
      QueryIntegerProperty<Homework>(_entities[0].properties[2]);
}

/// [Progress] entity fields to define ObjectBox queries.
class Progress_ {
  /// see [Progress.id]
  static final id = QueryIntegerProperty<Progress>(_entities[1].properties[0]);

  /// see [Progress.homeworkId]
  static final homeworkId =
      QueryIntegerProperty<Progress>(_entities[1].properties[1]);

  /// see [Progress.total]
  static final total =
      QueryIntegerProperty<Progress>(_entities[1].properties[2]);

  /// see [Progress.done]
  static final done =
      QueryIntegerProperty<Progress>(_entities[1].properties[3]);
}

/// [VacationPeriod] entity fields to define ObjectBox queries.
class VacationPeriod_ {
  /// see [VacationPeriod.id]
  static final id =
      QueryIntegerProperty<VacationPeriod>(_entities[3].properties[0]);

  /// see [VacationPeriod.startDate]
  static final startDate =
      QueryIntegerProperty<VacationPeriod>(_entities[3].properties[1]);

  /// see [VacationPeriod.endDate]
  static final endDate =
      QueryIntegerProperty<VacationPeriod>(_entities[3].properties[2]);
}
