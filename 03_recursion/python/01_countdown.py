def countdown(i):
  # base case
  if i < 1:
    # Finish decreasing and printing the numbers
    print()
    return
  # recursive case
  else:
    # Separate each number with ellipsis (...), except for the number 1.
    element_separator = "..." if i > 1 else ""
    # Print the numbers on the same line
    print(i, end=element_separator)
    return countdown(i - 1)


def main():
  print("Countdown for 10:")
  countdown(10)

  print("Countdown for 5:")
  countdown(5)

  print("Countdown for 3:")
  countdown(3)

  print("Countdown for 1:")
  countdown(1)

  print("Countdown for 0:")
  countdown(0)

  print("Countdown for -3:")
  countdown(-3)


main()
