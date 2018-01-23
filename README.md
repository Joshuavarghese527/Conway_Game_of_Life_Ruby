# Conway Game of Life (Ruby with TDD)

## Background of Game 

The universe of the Game of Life is an infinite two-dimensional orthogonal grid of square cells, each of which is in one of two possible states, living or dead, or "populated" or "unpopulated". Every cell interacts with its eight neighbours, which are the cells that are horizontally, vertically, or diagonally adjacent. At each step in time, the following transitions occur:

1. Any live cell with fewer than two live neighbours dies, as if caused by underpopulation.
2. Any live cell with two or three live neighbours lives on to the next generation.
3. Any live cell with more than three live neighbours dies, as if by overpopulation.
4. Any dead cell with exactly three live neighbours becomes a live cell, as if by reproduction.

The initial pattern constitutes the seed of the system. The first generation is created by applying the above rules simultaneously to every cell in the seed—births and deaths occur simultaneously, and the discrete moment at which this happens is sometimes called a tick (in other words, each generation is a pure function of the preceding one). The rules continue to be applied repeatedly to create further generations.

## Key requirement: 

## Rules 
1. Any live cell with fewer than two live neighbours dies, as if caused by underpopulation.
2. Any live cell with two or three live neighbours lives on to the next generation.
3. Any live cell with more than three live neighbours dies, as if by overpopulation.
4. Any dead cell with exactly three live neighbours becomes a live cell, as if by reproduction.

## Methods

1. Understand Problem
- Where does the tick method belong
- How should we represent the grid?
- How should we initialize the configuration?
- Who is responsible for applying the rules simultaneously? 

2. Test-Driven Game of Life
- Minitest 

## Moore Neighborhood
- The Moore Neighborhood is composed of nine cells: a central cell and the eight cells that surround it.

  | x - 1, y + 1 | x, y + 1 | x + 1, y + 1 |
  ------------------------------------------
  | x - 1,  y    | x,y      | x + 1, y     |
  ------------------------------------------
  | x - 1, y -1  | x, y - 1 | x + 1, y - 1 |

- We can fill the Moore Neighborhood with 0s and 1s randomly
- Tick method can be used for game class 


## What we want to accomplish

``` ruby
if (cell is dead) AND (number-of-neighbors is 3)
     # new cell is born
     set cell alive
if (cell is alive) AND (number-of-neighbors is 2 OR 3)
     # Leave the cell alive
     nothing to do
if (cell is alive AND (number-of-neighbors is NOT 2 OR 3)
     # lonely or over-crowded cells die
     set cell dead
if (cell is dead) AND (number-of-neighbors is NOT 3)
     # leave cell dead
     nothing to do
```

## CheckList

[x] Cell = living | # of live neighbors = 0, 1 | new_cell_state = 0 | Category = Lonely

[x] Cell = living | # of live neighbors = 4,5,6,7,8 | new_cell_state = 0 | Category =  Overcrowded

[x] Cell = living | # of live neighbors = 2,3 | new_cell_state = 1 | Category = Lives

[x] Cell = dead | # of live neighbors = 3 | new_cell_state = 1 | Category = Birth

[x] Cell = dead | # of live neighbors = 0,1,2,4,5,6,7,8 | new_cell_state = 0 | Category = Barren


