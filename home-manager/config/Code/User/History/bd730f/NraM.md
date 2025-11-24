# Weight calculation :

if using nix package manager please run 
```
nix-shell
```
first to get the prerequsit libraries, if not you will need to source `CUnit` from package manager

To run unit tests:
```
 gcc -o test_program -I./header unit_tests/board_test.c ./src/board.c ./src/loadcell.c -lcunit
 ./test_program
 ```

 To run main:
 ```
  gcc -o main -I./header src/main.c ./src/board.c ./src/loadcell.c -lcunit

  ./main
```
# Architecture 
![system architecture](diagram.png)

# Assumptions

instead of making functioning code for the ISR it is instead assumed that the ISR runs in the background which would then trigger the load ADC value to be updated.  