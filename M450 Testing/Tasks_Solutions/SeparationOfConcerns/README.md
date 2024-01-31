# Separation of Concerns

This project demonstrates the concept of _Separation of Concerns_ with code that
is totally devoid of it. The examples are:

1. [Multiplication Table](https://www.mathsisfun.com/tables.html)
(`SeparationOfConcerns/MultiplicationTable.cs`)
2. [Prime Factors](https://www.mathsisfun.com/prime-factorization.html)
(`SeparationOfConcerns/PrimeFactors.cs`)
3. [Monty Hall Problem](https://en.wikipedia.org/wiki/Monty_Hall_problem)
(`SeparationOfConcerns/MontyHall.cs`)

The code is run by `SeparationOfConcerns.Demo/Program.cs`:

    $ dotnet run --project SeparationOfConcerns.Demo

There are _no_ tests in `SeparationOfConcerns.Test` yet, because they'd be too
tedious to write due to the lack of Separation of Concerns in the code.

Your task is to clean up the mess, and then to write tests for the improved code.