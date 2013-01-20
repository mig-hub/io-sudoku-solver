Sudoku := Object clone
 
Sudoku board ::= nil
 
Sudoku init := method(inputBoard,
  setBoard(inputBoard)
  self
)
 
Sudoku validRowValue := method(rowNum, value,
  for(i, 0, board size - 1,
    if(board get(rowNum, i) == value, return(false))
  )
  true
)
 
Sudoku validColumnValue := method(colNum, value,
  for(i, 0, board size - 1,
    if(board get(i, colNum) == value, return(false))
  )
  true
)
 
Sudoku validRegionValue := method(row, col, value,
  rowStart := row - (row % 3)
  colStart := col - (col % 3)
  for(i, rowStart, rowStart + 2,
    for(j, colStart, colStart + 2,
      if(board get(i, j) == value, return(false))
    )
  )
  true
)
 
Sudoku _solve := method(row, col,
 
  if (row >= board size,
    solved = true
    return
  )

  if (board get(row, col) != 0,
    _next(row, col),

    for (i, 1, 9,
      if (validRowValue(row, i) and
        validColumnValue(col, i) and
        validRegionValue(row, col, i),

        board set(row, col, i)
        _next(row, col)
      )
    )
    (solved) ifFalse (board set(row, col, 0))
  )
)
 
Sudoku _next := method(row, col,
  if (col < board size - 1,
    _solve(row, col + 1),
    _solve(row + 1, 0)
  )
)
 
Sudoku solve := method(
  self solved := false
  _solve(0,0)
)
 
Sudoku show := method(board show)
 
