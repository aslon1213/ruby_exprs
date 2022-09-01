#!/usr/bin/env ruby
# Take a comma-separated list of colors and create an html table to sample them.
# Be sure to quote the colors given on the CLI because # will act as comment in
# in bash.
# Written by Ricky Elrod, ricky@elrod.me
# GPLv2+

if ARGV.empty?
    puts "Usage: #{$0} '#list,#of,#color,#codes'"
    exit 1
  end
  
  # This is a bit hackish, but it does this:
  # - Split the input up by commas.
  # - If the input is #rgb instead of #rrggbb, convert it to the latter.
  # - Take the rr, gg, bb values, convert them to integers, and add them up
  # - Store the result in color_hsh
  color_hsh = {}
  ARGV[0].downcase.gsub(' ', '').split(',').uniq.each do |color|
    if color.length == 3
      # This is 1-based because we expect to start with a #
      color_rgb = '#' + color[1]*2 + color[2] * 2 + color[3] * 2
    else
      color_rgb = color
    end
  
    total = color_rgb.sub('#', '').scan(/.{2}/).inject { |sum, octet| sum.to_i + octet.to_i(16) }
    color_hsh[color_rgb] = total    
  end
  
  # This converts color_hsh into an array of colors, sorted from dark to light.
  colors = color_hsh.sort_by { |k,v| v }.collect { |a| a[0] }
  
  puts '<style>'
  puts '  body { font-family: monospace; }'
  puts '  td { width: 200px; }'
  colors.each_with_index do |color, index|
    puts "  .color#{index} { background-color: #{color}; }"
  end
  puts '</style>'
  
  puts
  
  puts '<table>'
  puts '  <tr>'
  puts '    <th align="left">Color Sample</th>'
  puts '    <th align="left">Color Code</th>'
  puts '  </tr>'
  colors.each_with_index do |color, index|
    puts '  <tr>'
    puts "    <td class='color#{index}'></td>"
    puts "    <td>#{color}</td>"
    puts '  </tr>'
  end
  puts '</table>'