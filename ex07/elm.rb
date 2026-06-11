#!/usr/bin/env -S ruby -w

$page_name = "periodic_table.html"

def page_start
  File.write($page_name, "<!DOCTYPE html>\n<html lang=\"en\">\n<head>\n\t<title>snippets</title>\n\t<meta charset=\"utf-8\">\n\t<style>\n\t\th4 {font-size:11px; margin:0; margin-top:-30%;}\n\t\tul {list-style-type:none; padding:0; margin:0;}\n\t\ttd:nth-child(18n+1) li:nth-child(4n+2) {color:rgb(64, 216, 243)}\n\t\ttd:nth-child(18n+2) li:nth-child(4n+2) {color:rgb(255, 71, 39)}\n\t\ttd:nth-child(n+3):nth-child(-n+12) li:nth-child(4n+2) {color:rgb(158, 98, 255)}\n\t\ttd:nth-child(n+13):nth-child(-n+17) li:nth-child(4n+2) {color:rgb(218, 182, 86)}\n\t\ttd:nth-child(18n) li:nth-child(4n+2) {color:rgb(255, 56, 155)}\n\t\t.empty {border: 0px}\n\t\t.elem {border: 4px solid black; padding:5px; width:100px; height:100px;}\n\t</style>\n</head>\n<body>\n\t<div style=\"position:absolute; left:50%; transform: translate(-50%, 0);\">\n\t\t<h1 style=\"text-align:center; margin:0px\">Periodic Table</h1>\n\t\t<h2 style=\"text-align:center; margin:0px\">Mendeleïev style</h2>\n\t\t<h3 style=\"text-align:center; margin:0px\">by mbirou</h3>\n\t</div>\n\t<table style=\"border-collapse:collapse\">\n")

end

def open_tr
	File.write($page_name, "\t\t<tr>\n", mode: "a")
end

def close_tr
	File.write($page_name, "\t\t</tr>\n", mode: "a")
end

def format_data(data)
	return "\t\t\t\t<h4>#{data[0]}</h4>\n\t\t\t\t<ul>\n\t\t\t\t\t<li style=\"text-align:right; margin-top:-20px;\"><h2 style=\"font-size:10px;\">#{data[1][1]}</h2></li>\n\t\t\t\t\t<li><h3 style=\"font-size:40px; text-align:center; margin:0;\">#{data[1][2]}</h3></li>\n\t\t\t\t\t<li>#{data[1][3]}\n\t\t\t\t\t<li style=\"font-size:10px; margin-bottom:-20px\">#{data[1][4]}\n\t\t\t\t</ul>\n"
end

def td(data, is_empty)
  if (is_empty)
    File.write($page_name, "\t\t\t<td class=\"empty\"></td>\n", mode: "a")
  else
 	File.write($page_name, "\t\t\t<td class=\"elem\">\n#{format_data(data)}\t\t\t</td>\n", mode: "a")
  end
end

def page_end
  File.write($page_name, "\t</table>\n</body>\n</html>\n", mode: "a")
end

def main
  page_start
  elements = Hash.new
  File.foreach("periodic_table.txt") {|line| line = line.split(" = "); elements[line[0]] = line[1].split(/[:,\n]/).reject.with_index {|x, i| x.strip!; i % 2 == 0}}
  elements["end"] = ["0"]
  elements.each_cons(2) {|duo| elem = duo[0]; if elem[1][0].to_i == 0 then open_tr end; td(elem, false); if elem[1][0].to_i == 17 then close_tr end; ((elem[1][0].to_i)..(duo[1][1][0].to_i - 2)).each {td("", true)}}
  page_end
end


main