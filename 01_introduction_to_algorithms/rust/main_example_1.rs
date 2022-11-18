// name = "binary-search"
// version = "0.1.0"
// authors = ["giorgiodelgado <hi@gdelgado.ca>"]
//

// to run tests, you must have rust and cargo installed
// then run `cargo test`

use std::cmp;

// assumes that the slice is already sorted
fn binary_search<T: cmp::PartialOrd>(lst: &[T], item: T) -> Option<usize> {
    let mid = ((lst.len() / 2) as f32).ceil() as usize;

    match lst.get(mid) {
        None => None,
        Some(val) => {
            if *val == item {
                Some(mid)
            } else if *val > item {
                let sublist = &lst[..mid];
                binary_search(sublist, item)
            } else {
                let sublist = &lst[(mid + 1)..];
                // mapping is necessary when the item is
                // to the right of the middle since indices on the
                // sublist are erased and being at 0, 1, 2, 3, ... etc
                binary_search(sublist, item).map(|pos| pos + mid + 1)
            }
        },
    }
}

fn main() {
    let num_slice = &[2, 4, 5, 12, 15, 30, 32, 33, 34, 40, 45, 51, 55, 57, 60, 66, 70, 71, 90, 99, 100];

    let result = binary_search(num_slice, 70);

    println!("Result: {:?}", result);
}


#[cfg(test)]
mod test {
    use super::binary_search;

    #[test]
    fn finds_number_near_end_of_list() {
        let num_slice = &[2, 4, 5, 12, 15, 30, 32, 33, 34, 40, 45, 51, 55, 57, 60, 66, 70, 71, 90, 99, 100];

        assert_eq!(binary_search(num_slice, 70), Some(16));
    }

    #[test]
    fn finds_number_near_start_of_list() {
        let num_slice = &[2, 4, 5, 12, 15, 30, 32, 33, 34, 40, 45, 51, 55, 57, 60, 66, 70, 71, 90, 99, 100];

        assert_eq!(binary_search(num_slice, 5), Some(2));
    }

    #[test]
    fn returns_none_for_numbers() {
        let num_slice = &[2, 4, 5, 12, 15, 30, 32, 33, 34, 40, 45, 51, 55, 57, 60, 66, 70, 71, 90, 99, 100];

        assert_eq!(binary_search(num_slice, 1), None);
    }

    #[test]
    fn finds_char() {
        let char_slice = &[
            'a',
            'b',
            'c',
            'd',
            'e',
            'f',
            'g',
            'h',
            'i',
            'j',
            'k',
            'l',
            'm',
            'n',
            'o',
            'p',
            'q',
            'r',
            's',
            't',
            'u',
            'v',
            'w',
            'x',
            'y',
            'z',
        ];

        assert_eq!(binary_search(char_slice, 'l'), Some(11));
    }

    #[test]
    fn returns_none_for_chars() {
        let char_slice = &['a', 'b', 'c'];

        assert_eq!(binary_search(char_slice, 'l'), None);
    }
}
