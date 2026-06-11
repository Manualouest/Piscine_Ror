#!/usr/bin/env -S ruby -w

def main
  states = {
  "Oregon" => "OR",
  "Alabama" => "AL",
  "New Jersey" => "NJ",
  "Colorado" => "CO"
  }
  capitals_cities = {
  "OR" => "Salem",
  "AL" => "Montgomery",
  "NJ" => "Trenton",
  "CO" => "Denver"
  }

  if (ARGV.length() != 1)
    exit
  end
  
  capital = capitals_cities.key(ARGV[0].split(" ").each {|x| x.capitalize!}.join(" "))
  puts capital ? states.key(capital) : "Unknown capital city"

end


main