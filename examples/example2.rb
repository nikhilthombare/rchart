# an overlayed bar graph
require 'rubygems'
require 'rchart'
#Dataset definition

p = Rdata.new
p.add_point([1,4,-3,2,-3,3,2,1,0,7,4,-3,2,-3,3,5,1,0,7],"Serie1")
p.add_point([0,3,-4,1,-2,2,1,0,-1,6,3,-4,1,-4,2,4,0,-1,6],"Serie2")
p.add_all_series()
p.set_abscise_label_serie
p.set_serie_name("January","Serie1")
p.set_serie_name("February","Serie2")

#Initialise the graph
ch = Rchart.new(700,230)
ch.set_font_properties("tahoma.ttf",8)
ch.set_graph_area(50,30,585,200)
ch.draw_filled_rounded_rectangle(7,7,693,223,5,240,240,240)
ch.draw_rounded_rectangle(5,5,695,225,5,230,230,230)
ch.draw_graph_area(255,255,255,true)
ch.draw_scale(p.get_data,p.get_data_description,Rchart::SCALE_NORMAL,150,150,150,true,0,2,true)
ch.draw_grid(4,true,230,230,230,50)

#Draw the 0 line
ch.set_font_properties("tahoma.ttf",6)
ch.draw_treshold(0,143,55,72,true,true)

#Draw the bar graph
ch.draw_overlay_bar_graph(p.get_data,p.get_data_description)

#Finish the graph
ch.set_font_properties("tahoma.ttf",8)
ch.draw_legend(600,30,p.get_data_description,255,255,255)
ch.set_font_properties("tahoma.ttf",10)
ch.draw_title(50,22,"Example 2",50,50,50,585)
ch.render_png("example2")
