import gleam/io
import gleam/string

// Symbol       Value
// I             1
// V             5
// X             10
// L             50
// C             100
// D             500
// M             1000

// I can be placed before V (5) and X (10) to make 4 and 9. 
// X can be placed before L (50) and C (100) to make 40 and 90. 
// C can be placed before D (500) and M (1000) to make 400 and 900.

fn calc(list: List(String), total: Int) -> Int {
  case list {
    [] -> total
    [first, second, ..rest] -> {
      case should_subtract(first, second) {
        True -> calc(rest, total - value(first) + value(second))
        False -> calc([second, ..rest], total + value(first))
      }
    }
    [first, ..rest] -> {
      calc(rest, total + value(first))
    }
  }
}

fn should_subtract(first: String, second: String) -> Bool {
  value(first) < value(second)
}

fn value(numeral: String) -> Int {
  case numeral {
    "I" -> 1
    "V" -> 5
    "X" -> 10
    "L" -> 50
    "C" -> 100
    "D" -> 500
    "M" -> 1000
    _ -> 0
  }
}

pub fn main() {
  let rom = "XIV"
  let romlist = string.to_graphemes(rom)
  let total: Int = 0
  let finalnum = calc(romlist, total)
  io.debug(finalnum)
}
