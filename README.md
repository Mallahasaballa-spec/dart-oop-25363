# Dart Kigali_Bus_Card Assignment

- **Full Name:** Malla Hasaballa Ahmed Haggar
- **Registration Number:** 25363/2024
- **D:** 3
- **T:** 63
- **GitHub Username:** Mallahasaballa-spec


## Part 1: Why is there no setter for balance?

Having no public setter for balance prevents external code from
directly assigning an arbitrary balance through the card's public API.
The balance should change through topUp() and pay(), where the program
checks the transaction rules. This supports encapsulation and helps
protect the card's balance from invalid changes.