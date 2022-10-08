def binary_search(arr, target):
    if not arr:
        return -1
    elif len(arr) == 1:
        return -1 if arr[0] != target else target
    
    mid = len(array) // 2
    
    if arr[mid] == target:
        return target
    elif arr[mid] > target:
        return binary_search(arr[:mid], target)
    else:
        return binary_search(arr[mid+1:], target)
