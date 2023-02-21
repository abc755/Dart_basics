//Задание 8
class User {
  String email;

  User(this.email);
}

class AdminUser extends User with UserProps {
  AdminUser(String email) : super(email);
}

class GeneralUser extends User {
  GeneralUser(String email) : super(email);
}

mixin UserProps on User {
  String getMailSystem() {
    return this.email.split('@').last;
  }
}

class UserManager<T extends User> {
  Set<T> users = {};

  void addUser(T user) {
    users.add(user);
  }

  void deleteUser(T user) {
    users.remove(user);
  }

  void printUsersEmails() {
    List<String> emailList = [];
    users.forEach((element) {
      if (element is AdminUser) {
        emailList.add(element.getMailSystem());
      } else {
        emailList.add(element.email);
      }
    });
    print(emailList);
  }
}

void main() {
  print('\nЗадание 8');
  var users = UserManager();
  var petya = User('petya@domail.com');
  var kolya = AdminUser('kolya@admin.com');
  var vasya = GeneralUser('vasya@domail.com');
  users.addUser(petya);
  users.addUser(kolya);
  users.addUser(vasya);
  users.deleteUser(vasya);
  print('Список email пользователей после добавления и удаления:');
  users.printUsersEmails();
}