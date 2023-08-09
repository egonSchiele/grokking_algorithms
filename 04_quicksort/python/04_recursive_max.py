def max(lst):
    if len(lst) == 0:
        return None
    if len(lst) == 1:
        return lst[0]
    else:
        max_num = max(lst[1:])
        return lst[0] if lst[0] > max_num else max_num
