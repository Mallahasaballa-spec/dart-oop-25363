// Part 1: BusCard
class BusCard {
  String _owner = '';
  int _balance = 0;

  // Constructor
  BusCard(String owner, int balance) {
    _owner = owner;
    _balance = balance;
  }

  // Getter for owner
  String get owner {
    return _owner;
  }

  // TODO 1: Getter for balance
  int get balance {
    return _balance;
  }

  // Setter for owner
  set owner(String newName) {
    if (newName.length < 3) {
      print('Error: name too short');
    } else {
      _owner = newName;
    }
    return;
  }

  // Show card information
  void showInfo() {
    print('Owner: $_owner | Balance: $_balance RWF');
    return;
  }

  // TODO 2: Top up the card
  void topUp(int amount) {
    if (amount >= 500 && amount <= 50000) {
      _balance = _balance + amount;
      print('Topped up $amount RWF');
    } else {
      print('Error: top-up must be 500 to 50000 RWF');
    }
    return;
  }

  // TODO 3: Pay the bus fare
  void pay(int fare) {
    if (fare > _balance) {
      print('Card declined');
    } else {
      _balance = _balance - fare;
      print('Paid $fare RWF');
    }
    return;
  }
}

// Part 2: StudentCard
class StudentCard extends BusCard {
  int _discount = 0;

  // Constructor
  StudentCard(String owner, int balance, int discount)
      : super(owner, balance) {
    _discount = discount;
  }

  // Show card information and discount
  @override
  void showInfo() {
    super.showInfo();
    print('Student card: $_discount% off');
    return;
  }

  // TODO 4: Pay with the student discount
  @override
  void pay(int fare) {
    int off = fare * _discount ~/ 100;
    print('Student discount: $off RWF');
    super.pay(fare - off);
    return;
  }
}

// Part 3: Use the classes in main()
void main() {
  // by MHAH
  // My numbers: D = 63, L = 3
  // Starting balance = 1630 RWF, Bus fare = 263 RWF, Discount = 13%

  // Create a card and test the setter
  BusCard card = BusCard('Moalla', 1630);

  card.owner = 'Al';
  card.showInfo();

  // TODO 5: Change the owner to your full name
  card.owner = 'Moalla Hasaballa Ahmed Haggar';
  card.showInfo();

  // TODO 6: Refuse 100 RWF, then accept 2000 RWF
  card.topUp(100);
  card.topUp(2000);

  // TODO 7: Pay the bus fare twice
  card.pay(263);
  card.pay(263);
  card.showInfo();

  // TODO 8: Create a student card
  StudentCard studentCard = StudentCard('Moalla', 1630, 13);

  // TODO 9: Pay with the student card and show its information
  studentCard.pay(263);
  studentCard.showInfo();

  return;
}