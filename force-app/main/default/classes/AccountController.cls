public class AccountController {
  public static Account getAccountById(Id accountId) {
    return [SELECT Id, Name, Phone, Website FROM Account WHERE Id = :accountId];
  }

  public static List<Account> getAccountByName(String accountName) {
    return Database.query(
      'SELECT Id, Name, Phone, Website FROM Account WHERE Name = \'' +
        accountName +
        '\''
    );
  }
}
