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

// Demonstration for Parts 1 and 2
void main() {
  // by MHAH

  print('=== Part 1: BusCard ===');

  BusCard card = BusCard('Moalla', 1630);

  card.showInfo();

  print('Owner: ${card.owner}');
  print('Balance: ${card.balance} RWF');

  card.owner = 'Moalla Haggar';
  card.owner = 'Mo';

  card.topUp(1000);
  card.topUp(200);

  card.pay(263);
  card.pay(5000);

  card.showInfo();

  print('');
  print('=== Part 2: StudentCard ===');

  StudentCard studentCard = StudentCard('Moalla', 1630, 13);

  studentCard.showInfo();
  studentCard.pay(263);
  studentCard.showInfo();

  return;
}