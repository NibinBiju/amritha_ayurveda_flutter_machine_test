abstract class UseCase<type, Params> {
  Future<type> call({Params params});
}
