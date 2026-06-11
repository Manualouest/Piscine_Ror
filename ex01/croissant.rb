#!/usr/bin/env -S ruby -w

def main
	puts File.read("numbers.txt").split(",\n").map(&:to_i).sort
end


main