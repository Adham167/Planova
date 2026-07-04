import 'dart:async';
import 'package:dartz/dartz.dart';
import 'package:planova_app/core/errors/failure.dart';
import 'package:planova_app/features/group/domain/entities/group_entity.dart';
import 'package:planova_app/features/group/domain/repos/groups_repo.dart';

class StreamMyGroupsUseCase {
  final GroupsRepo groupsRepo;

  StreamMyGroupsUseCase(this.groupsRepo);

  Stream<Either<Failure, List<GroupEntity>>> call() {
    return groupsRepo.streamGroups();
  }
}