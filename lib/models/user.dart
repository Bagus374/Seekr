part of 'models.dart';

class User extends Equatable {
  final String id;
  final String email;
  final String name;
  final String profilePicture;
  final int balance;

  User(
    this.id,
    this.email, {
    this.name,
    this.profilePicture,
    this.balance,
  });

  @override
  String toString() {
    return "[$id] - $name, $email";
  }

  @override
  List<Object> get props => [id, email, name, profilePicture];
}
