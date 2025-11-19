import gleam/order.{type Order}
import gleam/list
import gleam/float

pub type City {
  City(name: String, temperature: Temperature)
}

pub type Temperature {
  Celsius(Float)
  Fahrenheit(Float)
}

pub fn fahrenheit_to_celsius(f: Float) -> Float {
  { f -. 32.0 } /. 1.8
}

pub fn compare_temperature(left: Temperature, right: Temperature) -> Order {
  let cl = case left {
    Celsius(temp) -> temp
    Fahrenheit(temp) -> fahrenheit_to_celsius(temp)
  }
  let cr = case right {
    Celsius(temp) -> temp
    Fahrenheit(temp) -> fahrenheit_to_celsius(temp)
  }
  float.compare(cl, cr)
}

pub fn sort_cities_by_temperature(cities: List(City)) -> List(City) {
  list.sort(cities, fn(x: City, y: City) {compare_temperature(x.temperature, y.temperature)})
}
