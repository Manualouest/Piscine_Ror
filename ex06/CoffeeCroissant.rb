#!/usr/bin/env -S ruby -w

def main
  data = [
  ['Frank', 33],
  ['Stacy', 15],
  ['Juan' , 24],
  ['Dom' , 32],
  ['Steve', 24],
  ['Jill' , 24]
  ]

  data.sort {|a,b| (a[1] <=> b[1]) != 0 ? a[1] <=> b[1] : a[0] <=> b[0]}.each {|x| puts x[0]}
end


main