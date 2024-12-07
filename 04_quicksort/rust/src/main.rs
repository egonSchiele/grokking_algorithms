fn rec_sum(list: &[usize]) -> usize {
    match list.get(0) {
        Some(x) => x + rec_sum(&list[1..]),
        None => 0,
    }
}

fn rec_count<T>(list: &[T]) -> usize {
    match list.get(0) {
        Some(_) => 1 + rec_count(&list[1..]),
        None => 0,
    }
}

fn maximum<T: Ord>(list: &[T]) -> Option<&T> {
    match list.get(0) {
        Some(x) => match maximum(&list[1..]) {
            Some(max) => {
                if x > max {
                    Some(x)
                } else {
                    Some(max)
                }
            }
            None => Some(x),
        },
        None => None,
    }
}

fn binary_search<T: Ord>(list: &[T], item: T) -> Option<usize> {
    let mid = list.len() / 2;

    match list.get(mid) {
        None => None,
        Some(val) => {
            if *val == item {
                Some(mid)
            } else if *val > item {
                let sublist = &list[..mid];
                binary_search(sublist, item)
            } else {
                let sublist = &list[(mid + 1)..];
                binary_search(sublist, item)
            }
        }
    }
}

fn quicksort<T: Ord + Clone>(list: &Vec<T>) -> Vec<T> {
    if list.len() < 2 {
        list.to_vec()
    } else {
        let pivot = &list[0];

        let mut less = vec![];
        let mut greater = vec![];

        for x in &list[1..] {
            if x <= pivot {
                less.push(x.clone());
            } else {
                greater.push(x.clone());
            }
        }

        let mut new = Vec::with_capacity(list.len());
        new.append(&mut quicksort(&less));
        new.push(pivot.clone());
        new.append(&mut quicksort(&greater));
        new
    }
}

fn main() {
    let list = vec![10, 5, 2, 12, 3];

    println!("quicksort: {:?}", quicksort(&list));
    println!("binary search: {:?}", binary_search(&list, 3));
    println!("sum: {}", rec_sum(&list));
    println!("count: {}", rec_count(&list));
    println!("maximum: {:?}", maximum(&list));
}

#[cfg(test)]
mod test {
    use super::*;

    #[test]
    fn simple_rec_sum() {
        let list = [2, 4, 6];
        let expected = 12;

        let result = rec_sum(&list);

        assert_eq!(result, expected);
    }

    #[test]
    fn simple_rec_count() {
        let list = [2, 4, 6];
        let expected = 3;

        let result = rec_count(&list);

        assert_eq!(result, expected);
    }

    #[test]
    fn simple_maximum() {
        let list = [2, 4, 6, 3];
        let expected = 6;

        let result = maximum(&list);

        assert_eq!(result, Some(&expected));
    }

    #[test]
    fn simple_binary_search() {
        let list = &[2, 3, 4, 13, 40];
        let item = 3;
        let expected = Some(1);

        let result = binary_search(list, item);

        assert_eq!(result, expected);
    }

    #[test]
    fn search_for_nonexistent_item() {
        let list = &[2, 3, 4, 13, 40];
        let item = 100;
        let expected = None;

        let result = binary_search(list, item);

        assert_eq!(result, expected);
    }
}
