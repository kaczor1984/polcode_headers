tab=[{ id: 1, title: "heading1", heading_level: 0 },
{ id: 2, title: "heading2", heading_level: 2 },
{ id: 3, title: "heading3", heading_level: 1 },
{ id: 4, title: "heading4", heading_level: 1 }]

def handle_tab(tab)
  tab.each do |tab_item|
    level = tab_item[:heading_level]
    item = tab_item[:title]
    level.downto(0) do |level|
      item = "<li style='li_#{level}'>#{item}</li>"
      puts "level #{level}"
    end
    #tab_item[:title]
    puts "-> #{item}"
  end
end

handle_tab(tab)
