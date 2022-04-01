import 'package:drift_db_viewer/drift_db_viewer.dart';
import 'package:flutter/material.dart';
import 'package:habithouse_io/repository/drift/database.dart';
import 'package:habithouse_io/repository/storage.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

Widget dbViewerView(ProviderRef ref) =>
    DriftDbViewer((ref.read(storageProvider) as AppDb));
