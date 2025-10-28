import random

def lot():
    print("Welcome to the Lottery Game!")
    print("Choose 3 unique numbers between 1 and 10.")

    user_numbers = set()
    while len(user_numbers) < 3:

        try:
            number = int(input("Enter a number: "))
            if 1 <= number <= 10:
                user_numbers.add(number)

            else:
                print("Invalid number. Please choose a number between 1 and 10.")
                print("Your chosen numbers are:", user_numbers)
        except ValueError:

            print("Invalid input. Please enter a valid number.")
            print("Your chosen numbers are:", user_numbers)

            lottery_numbers = set(random.sample(range(1, 11), 3))
            print("The lottery numbers are:", lottery_numbers)

            if user_numbers == lottery_numbers:
                print("Congratulations! You've won the lottery!")
                print("Your winning numbers are:", lottery_numbers)
            else:     
                print("Sorry, better luck next time!")
                print("Your chosen numbers are:", user_numbers)
