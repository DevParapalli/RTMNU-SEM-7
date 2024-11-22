def find_2w_4w(total_vehicles: int, total_wheels: int) -> tuple[int, int]:
    for i in range(total_vehicles + 1):
        if 2 * i + 4 * (total_vehicles - i) == total_wheels:
            return i, total_vehicles - i
    return -1, -1

print(find_2w_4w(200, 540)) 