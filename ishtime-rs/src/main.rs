use chrono::prelude::*;
use clap::Parser;

fn ishtime<T: Timelike>(time: T) -> String {
    let (hour, minute) = {
        let mut hour = time.hour();
        let minute = time.minute();
        if minute >= 33 {
            hour += 1;
        }
        (hour, minute)
    };

    let hour_str = match hour % 12 {
        0 => "twelve",
        1 => "one",
        2 => "two",
        3 => "three",
        4 => "four",
        5 => "five",
        6 => "six",
        7 => "seven",
        8 => "eight",
        9 => "nine",
        10 => "ten",
        11 => "eleven",

        12..=u32::MAX => unreachable!(),
    };

    let minute_str = match minute {
        58..=59 | 0..=2 => return format!("It's {hour_str} o'clock."),

        3..=7 => "five past",
        8..=12 => "ten past",
        13..=17 => "quarter past",
        18..=22 => "twenty past",
        23..=27 => "twenty-five past",
        28..=32 => "half past",
        33..=37 => "twenty-five to",
        38..=42 => "twenty to",
        43..=47 => "quarter to",
        48..=52 => "ten to",
        53..=57 => "five to",

        60..=u32::MAX => unreachable!(),
    };

    format!("It's {minute_str} {hour_str}.")
}

#[derive(Debug, clap::Parser)]
struct Args {
    #[arg(short, long, default_value_t = chrono::Local::now().time())]
    time: chrono::NaiveTime,
}

fn main() {
    let args = Args::parse();
    println!("{}", ishtime(args.time));
}
