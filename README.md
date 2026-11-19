# Kigali Bus Card — Parts 1 and 2

## Student Details

Name: Moalla Hasaballa Ahmed Haggar
Student ID: 25363/2024

## Personal Values

Using 25363 as the student number:

- D = 63
- L = 3
- Starting balance = 1000 + (63 \* 10) = 1630 RWF
- Bus fare = 200 + 63 = 263 RWF
- Student discount = 10 + 3 = 13%

## Part 1: Why is there no setter for balance?

Having no public setter for balance prevents external code from
directly assigning an arbitrary balance through the public API.
The balance should change through topUp() and pay(), which check
the transaction rules. This supports encapsulation.

## Part 2: What does ~/ do?

The ~/ operator divides and truncates the result toward zero,
returning an integer.

print(237 \* 17 / 100);
Output: 40.29

print(237 \* 17 ~/ 100);
Output: 40

The / operator returns a double, while ~/ returns an int.
The assignment uses ~/ to calculate the discount in whole francs.

For my student card:

Discount = 263 \* 13 ~/ 100 = 34 RWF
Amount paid = 263 - 34 = 229 RWF
Remaining balance = 1630 - 229 = 1401 RWF

## Run the Program

dart run main.dart

## Part 3: Full Program Output

```
Error: name too short
Owner: Moalla | Balance: 1630 RWF
Owner: Moalla Hasaballa Ahmed Haggar | Balance: 1630 RWF
Error: top-up must be 500 to 50000 RWF
Topped up 2000 RWF
Paid 263 RWF
Paid 263 RWF
Owner: Moalla Hasaballa Ahmed Haggar | Balance: 3104 RWF
Student discount: 34 RWF
Paid 229 RWF
Owner: Moalla | Balance: 1401 RWF
Student card: 13% off
```

## Part 4: Bug Hunt

Line numbers refer to the original buggy code.

| Bug       | The line                                                          | Why it is wrong (my words)                                                                                                                                      | My fix                                                                    |
| --------- | ----------------------------------------------------------------- | --------------------------------------------------------------------------------------------------------------------------------------------------------------- | ------------------------------------------------------------------------- |
| 1         | Lines 2–3: `String _brand;` and `int _battery;`                   | These non-nullable fields are not initialized at declaration or through constructor initialization. Assigning values inside the constructor body is not enough. | Initialize them with `String _brand = '';` and `int _battery = 0;`.       |
| 2         | Line 18: `SmartPhone(String brand, int battery, String system) {` | The child constructor does not pass the required arguments to the parent constructor.                                                                           | Add `: super(brand, battery)` before the constructor body.                |
| 3         | Line 22: `@override`                                              | Phone has no restart() method, so this annotation incorrectly claims that restart() overrides an inherited method.                                              | Remove `@override`.                                                       |
| 4         | Line 30: `p.battery = 100;`                                       | There is no battery setter, so the assignment is not allowed.                                                                                                   | Add a setter that accepts only values from 0 to 100. Keep the assignment. |
| 5         | Line 31: `print(p.battery());`                                    | battery is a getter and must be accessed without parentheses.                                                                                                   | Change it to `print(p.battery);`.                                         |
| Not a bug | Line 29: `Phone p = new Phone('Tecno', 50);`                      | The new keyword is valid and optional in Dart.                                                                                                                  | None.                                                                     |

### Fixed Program Output

```
100
```
