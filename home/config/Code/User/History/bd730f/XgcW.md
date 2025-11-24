#Weight calculation write up:


To run unit tests:
```
 gcc -o test_program -I./header unit_tests/board_test.c ./src/board.c ./src/loadcell.c -lcunit
 ./test_program
 ```

 To run main:
 ```
  gcc -o main -I./header src/main.c ./src/board.c ./src/loadcell.c -lcunit

  ./main
#Assumptions
