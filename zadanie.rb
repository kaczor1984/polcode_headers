#!/usr/bin/env ruby

@html = %{ <!DOCTYPE html>
<html lang="en">
  <head>
    <meta charset="utf-8">
    <title>title</title>
    <style>
      ol {
        counter-reset: section;
        list-style-type: none;
      }

      li:before {
        counter-increment: section;
        content: counters(section, ".");
      }
    </style>
  </head>
  <body>
    #content
  </body>
</html> }

tab=[{ id: 1, title: "heading1", heading_level: 0 },
{ id: 2, title: "heading2", heading_level: 2 },
{ id: 3, title: "heading3", heading_level: 1 },
{ id: 4, title: "heading4", heading_level: 1 }]

tab2 = [{ id: 1, title: "heading1", heading_level: 0 },
{ id: 2, title: "heading2", heading_level: 3 },
{ id: 3, title: "heading3", heading_level: 4 },
{ id: 4, title: "heading4", heading_level: 1 },
{ id: 5, title: "heading5", heading_level: 0 },
{ id: 1, title: "heading1", heading_level: 0 },
{ id: 2, title: "heading2", heading_level: 3 },
{ id: 3, title: "heading3", heading_level: 4 },
{ id: 4, title: "heading4", heading_level: 1 },
{ id: 5, title: "heading5", heading_level: 0 }]

def handle_tab(tab, file)
  items = []
  tab.each do |tab_item|
    full_level = tab_item[:heading_level]
    item = tab_item[:title]
    full_level.downto(0) do |level|
      if level == full_level
        item = "<li><p style='display: inline; margin: 10px;'>#{item}</p></li>"
      else
        item = "<ol>#{item}</ol>"
      end
      puts "level #{level}"
    end
    #tab_item[:title]
    puts "-> #{item}"
    items << item
  end
  puts "-> <ol>#{items.join('')}</ol>\n"
  file.write(@html.gsub(/#content/, "<ol>#{items.join('')}</ol>\n"))
end

file = File.open('./output.html', 'w')
handle_tab(tab2, file)
file.close

