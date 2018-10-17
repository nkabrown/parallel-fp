Row : Type
Row = List Int

Students : Type
Students = List Row

row1 : Row
row1 = [1, 0, 1]

row2 : Row
row2 = [0, 1, 1]

row3 : Row
row3 = [0, 0, 1]

classroom : Students
classroom = [row1, row2, row3]

count : (s : Students) -> Int
count s = sum (map sum s)

sumTree : (xs : Row) -> Int
sumTree xs = foldl (+) 0 xs

countTree : (s : Students) -> Int
countTree s = sumTree (map sumTree s)
