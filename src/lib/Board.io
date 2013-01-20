Board := Object clone
 
Board board := nil
 
Board show := method(
  board foreach(row,
    row join(" ") println
  )
)
 
Board get := method(row, col,
  board at(row) at(col)
)
 
Board set := method(row, col, value,
  board at(row) atPut(col, value)
)
 
Board size := method(board size)
 
Board readFromFile := method(filename,
  file := File clone openForReading(filename)
  lines := file readLines
  file close
  self board = lines map(l,
    l split(",") map(asNumber)
  )
  self
)

