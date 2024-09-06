def print_sum_of_primes(n):
    sum = 0
    for i in range(2, n):
        for j in range(2, i):
            if i % j == 0:
                break
        else:
            sum += i
    return sum

print(print_sum_of_primes(10))