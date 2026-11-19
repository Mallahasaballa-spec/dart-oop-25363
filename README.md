# Kigali Bus Card — Parts 1 and 2

## Student Details

Name: Moalla Hasaballa Ahmed Haggar
Student ID: 25363/2024

## Personal Values

Using 25363 as the student number:

- D = 63
- L = 3
- Starting balance = 1000 + (63 * 10) = 1630 RWF
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

print(237 * 17 / 100);
Output: 40.29

print(237 * 17 ~/ 100);
Output: 40

The / operator returns a double, while ~/ returns an int.
The assignment uses ~/ to calculate the discount in whole francs.

For my student card:

Discount = 263 * 13 ~/ 100 = 34 RWF
Amount paid = 263 - 34 = 229 RWF
Remaining balance = 1630 - 229 = 1401 RWF

## Run the Program

dart run main.dart