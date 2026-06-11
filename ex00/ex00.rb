#!/usr/bin/env -S ruby -w

class Html
  attr_reader :page_name
  
  def initialize(file_name)
    @page_name = file_name
    Head()
  end

  def Head
    File.write(@page_name + ".html", "<!DOCTYPE html>\n<html>\n<head>\n<title>#{@page_name}</title>\n</head>\n<body>\n")
  end

  def dump(text)
    File.write(@page_name + ".html", "\t<p>#{text}</p>\n", mode: "a")
  end

  def finish
    File.write(@page_name + ".html", "</body>\n", mode: "a")
  end

end
