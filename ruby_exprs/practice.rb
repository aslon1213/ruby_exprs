require 'open-uri'

DIRNAME = "ruby-exercises"

hash = Dir.glob("#{DIRNAME}/**/*.*").inject({}) do |hsh, fname|
   ext = File.basename(fname).split('.')[-1].to_s.downcase
   hsh[ext] ||= [0,0]
   hsh[ext][0] += 1
   hsh[ext][1] += File.size(fname)   
   hsh
end               
File.open("file-analysis.txt", "w") do |f|
   hash.each do |arr|
     txt = arr.flatten.join("\t")
      f.puts txt
      puts txt
   end
end


BASE_URL = "https://chart.googleapis.com/chart?cht=p&chs=500x300"
rows = File.open("file-analysis.txt"){|f| f.readlines.map{|p| p.strip.split("\t")} }

headers = rows[0]
[1,2].each do |idx|
   labels = []
   values = []
   rows[1..-1].each do |row|
      labels << row[0]
      values << row[idx]
   end
   
   remote_google_img = URI.encode"#{BASE_URL}&chl=#{labels.join('|')}&chd=t:#{values.join(',')}"
puts remote_google_img
  File.open('file-pie-chart.png', 'w'){|f| 
    f.write(open(remote_google_img))
  }
end