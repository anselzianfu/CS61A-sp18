""" Optional problems for Lab 3 """

from lab03 import *

## Higher order functions

def cycle(f1, f2, f3):
    """Returns a function that is itself a higher-order function.

    >>> def add1(x):
    ...     return x + 1
    >>> def times2(x):
    ...     return x * 2
    >>> def add3(x):
    ...     return x + 3
    >>> my_cycle = cycle(add1, times2, add3)
    >>> identity = my_cycle(0)
    >>> identity(5)
    5
    >>> add_one_then_double = my_cycle(2)
    >>> add_one_then_double(1)
    4
    >>> do_all_functions = my_cycle(3)
    >>> do_all_functions(2)
    9
    >>> do_more_than_a_cycle = my_cycle(4)
    >>> do_more_than_a_cycle(2)
    10
    >>> do_two_cycles = my_cycle(6)
    >>> do_two_cycles(1)
    19
    """
    "*** YOUR CODE HERE ***"
    def inner(n):
        def combiner(x):
            if n == 0:
                return x
            else:
                count = 0
                combine = x
                while count < n:
                    count += 1
                    if count % 3 == 1:
                        combine = f1(combine)
                    elif count % 3 == 2:
                        combine = f2(combine)
                    else:
                        combine = f3(combine)
                return combine
        return combiner
    return inner


## Lambda expressions

def is_palindrome(n):
    """
    Fill in the blanks '_____' to check if a number
    is a palindrome.

    >>> is_palindrome(12321)
    True
    >>> is_palindrome(42)
    False
    >>> is_palindrome(2015)
    False
    >>> is_palindrome(55)
    True
    """
    x, y = n, 0
    f = lambda: 10 * y + x % 10
    while x > 0:
        x, y = x // 10, f()
    return y == n

## More recursion practice

def skip_mul(n):
    """Return the product of n * (n - 2) * (n - 4) * ...

    >>> skip_mul(5) # 5 * 3 * 1
    15
    >>> skip_mul(8) # 8 * 6 * 4 * 2
    384
    """
    if n == 2:
        return 2
    elif n == 1:
        return 1
    else:
        return n * skip_mul(n - 2)

def is_prime(n):
    """Returns True if n is a prime number and False otherwise.

    >>> is_prime(2)
    True
    >>> is_prime(16)
    False
    >>> is_prime(521)
    True
    """
    "*** YOUR CODE HERE ***"
    def helper(n, indicator = n, count = 0):
        if n == 1:
            return False
        elif n == 2:
            return True
        else:
            if indicator == 1:
                if count < 2:
                    return True
                else:
                    return False
            else:
                indicator -= 1
                if n % indicator == 0:
                    count += 1
                    return helper(n, indicator, count)
                else:
                    return helper(n, indicator, count)
    return helper(n)




def interleaved_sum(n, odd_term, even_term):
    """Compute the sum odd_term(1) + even_term(2) + odd_term(3) + ..., up
    to n.

    >>> # 1 + 2^2 + 3 + 4^2 + 5
    ... interleaved_sum(5, lambda x: x, lambda x: x*x)
    29
    """
    "*** YOUR CODE HERE ***"
    def helper_odd(n, indicator = 0, summation = 0):
        if indicator == n:
            return summation
        else:
            indicator += 1
            summation += odd_term(indicator)
            return helper_even(n, indicator, summation)

    def helper_even(n, indicator, summation):
        if indicator == n:
            return summation
        else:
            indicator += 1
            summation += even_term(indicator)
            return helper_odd(n, indicator, summation)
    return helper_odd(n)

def ten_pairs(n):
    """Return the number of ten-pairs within positive integer n.

    >>> ten_pairs(7823952)
    3
    >>> ten_pairs(55055)
    6
    >>> ten_pairs(9641469)
    6
    """
    "*** YOUR CODE HERE ***"
    def inner(n, indicator = 1, times2 = 0):
        if n < 10:
            return 0
        if indicator == 5:
            return helper(n, 5) * (helper(n, 5) - 1) // 2 + times2
        else:
            return inner(n, indicator + 1, helper(n, indicator) * helper(n, 10 - indicator) + times2)

    def helper(n, goal, times = 0):
        if n < 10 and n == goal:
            return times + 1
        elif n < 10:
            return times
        elif n % 10 == goal:
            return helper(n // 10, goal, times + 1)
        else:
            return helper(n // 10, goal, times)
    return inner(n)