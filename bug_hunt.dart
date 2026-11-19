class Phone {
  String _brand = '';
  int _battery = 0;

  // Constructor
  Phone(String brand, int battery) {
    _brand = brand;
    _battery = battery;
  }

  // Getter for battery
  int get battery {
    return _battery;
  }

  // Setter: accept only values from 0 to 100
  set battery(int value) {
    if (value >= 0 && value <= 100) {
      _battery = value;
    } else {
      print('Error: battery must be 0 to 100');
    }
    return;
  }
}

class SmartPhone extends Phone {
  String _system = '';

  // Call the parent constructor
  SmartPhone(String brand, int battery, String system) : super(brand, battery) {
    _system = system;
  }

  // New method: not an override
  void restart() {
    print('Restarting $_system');
    return;
  }
}

void main() {
  // by MHAH
  Phone p = new Phone('Tecno', 50);
  p.battery = 100;
  print(p.battery);
  return;
}
