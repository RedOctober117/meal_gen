fn main() {
    let x = 4;
    print!("{}\n", average(x));
    let y = x;
    print!("{}", x);

    // let y: [i32; 2] = [1, 2];
    // print!("{}\n", average_array(&y));
}

fn average(x: i32) -> i32 {
    x * x
}

fn average_array(x: &[i32]) -> i32 {
    x[0] * x[1]
}
