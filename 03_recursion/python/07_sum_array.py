def sum_array(arr):
    if not arr:
        return 0
    return arr[0] + sum_array(arr[1:])