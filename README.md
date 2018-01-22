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
1. Assumptions
- Simplify by making 3x3 grid
- Number of generations over which to observe the evolution is 3.

2. Understand Problem
- Where does the tick method belong
- How should we represent the grid?
- How should we initialize the configuration?
- Who is responsible for applying the rules simultaneously? 

3. Test-Driven Game of Life
- Minitest 

## Moore Neighborhood
- The Moore Neighborhood is composed of nine cells: a central cell and the eight cells that surround it.

  | x - 1, y + 1 | x, y + 1 | x + 1, y + 1 |
  | x - 1,  y    | x,y      | x + 1, y     |
  | x - 1, y -1  | x, y - 1 | x + 1, y - 1 |

- We can fill the Moore Neighborhood with 0s and 1s randomly
- Tick method can be used for game class 

## Test Cases 

- A 3 x 3 grid with no living cells will contain no living cells in the next generation.

- A 3 x 3 grid with one living cell will die in the next generation.

- A 3 x 3 grid with two live cells will stay living in the next generation.

## List of Neighbors 3x3 grid 

- NorthWest : North, Center, West
- NorthEast : North, Center, East
- SouthWest : West, Center, South
- SouthEast : East, Center, South
- Center: Has everyone as its neighbors
- North: NorthWest, Center, NorthEast, West, East
- South: SouthWest, SouthEast, Center, East, West
- East: NorthEast, SouthEast, Center, North, South
- West: NorthWest, North, Center, South, SouthWest

## Specific Coordinate for neighbor locations

- NorthWest -> (-1, 1)
- NorthEast  -> (1, 1)
- SouthWest -> (-1, -1)
- SouthEast  -> (1, -1)
- Center -> (0, 0)
- North -> (0, 1)
- South -> (0, -1)
- East -> (1, 0)
- West -> (-1, 0)


