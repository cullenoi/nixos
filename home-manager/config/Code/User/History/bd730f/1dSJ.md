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
## Operation:
How this is assumed to run is that the ISR will run and get the adc value, you can then check the most recent value* for that channel by checking the register. (realistically on the interupt you would up all the values for each load cell // store each interupt value to use to get a better average but this was to show architecture design)

To get the load on each the channel for each adc is accessed and the value is found (for testing they were set to one ADC value but random was also used to allow varience and failures)

instead of making functioning code for the ISR it is instead assumed that the ISR runs in the background which would then trigger the load ADC value to be updated.  