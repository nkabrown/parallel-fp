Let's begin to learn how to write parallel functional programs by defining a function to count the number of students who took a prerequisite course. In Idris how do we define a function? We declare a function type which has one or more input types and an output type. For our `count` function the input type is Students and output type is an Int representing the number of students who took the course prerequisite. Our function will transform our representation of students into a single number. Below is our function type declaration.

`count : Students -> Int`

We can represent the students as a List of Ints where those students who did not take the prerequisite are a zero and those who did are the number one `[0,1,1,1,0,1,0,0,1]`. We must partition this list into sub-lists if we want to process this data in parallel. Students becomes a List of List of Ints `List (List Int)`. In Idris we can refine this type with type synonyms. We can create a Row type for the sub-lists and a Students type for the List of Rows.

> Row : Type
> Row = List Int

> Students : Type
> Students = List Row

We represent each row of students as a list of integers.

>row1 : Row
>row1 = [1, 0, 1]

>row2 : Row
>row2 = [0, 1, 1]

>row3 : Row
>row3 = [0, 0, 1]

To represent a group of students as a compound data structure we can form a list of lists.

>classroom : Students
>classroom = [row1, row2, row3]

Write a parallel functional program to compute the number of students who took the course prerequisite.

>count : (s : Students) -> Int
>count s = sum (map sum s)
