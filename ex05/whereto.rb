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

  ARGV.length() != 1 ? exit : ARGV[0].split(",").map {|x| x.split(" ").each {|x| x.capitalize!}.join(" ")}.reject {|x| x.empty?}.each {|place| if states[place] then puts "#{capitals_cities[states[place]]} is the capital of #{place} (akr: #{states[place]})" elsif capitals_cities.key(place) then puts "#{place} is the capital of #{states.key(capitals_cities.key(place))} (akr: #{capitals_cities.key(place)})" else puts "#{place} is neither a capital city nor a state" end}
end


main