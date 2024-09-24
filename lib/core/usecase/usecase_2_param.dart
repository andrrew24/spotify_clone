abstract class Usecase2Param<Type, Params> {
  Future<Type> call({Params userId, Params songId});
}
