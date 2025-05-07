enum FirebaseFirestoreQueryOperator { isEqualTo }

class FirebaseFirestoreQueryFilter {
  final String field;
  final dynamic value;
  final FirebaseFirestoreQueryOperator operator;

  FirebaseFirestoreQueryFilter({
    required this.field,
    required this.value,
    required this.operator,
  });
}
