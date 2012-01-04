$:.unshift(File.dirname(__FILE__))

require 'rubygems'
require 'iconv'
@ic1 = Iconv.new("UTF-8//IGNORE", "GBK//IGNORE")

Dir.glob("*[^rb]").each do |filename|
	arr =[]
	arr << '<html><head><meta http-equiv="Content-Type" content="text/html; charset=utf-8" /></head><body>'
	File.open(filename, "r").each_line do |line|
		line = @ic1.iconv(line)
		if line =~ /\s{2,4}/
		   line = "<li>#{line}</li>\n"
		elsif line =~ /\s{4,}/
		   line = "<li>#{line}</li>\n"
		else
		   line = "<h3>#{line}</h3>\n\n"
		end
		arr << Iconv.iconv("GBK//IGNORE", "UTF-8//IGNORE", line)
	end
	arr << '</body></html>'
	File.new("#{filename}_format.html", "w").write(arr.join("<br/>"))
	break
end


