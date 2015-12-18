#!/usr/bin/ruby

RED = "\033[31m"
GREEN = "\033[32m"
YELLOW = "\033[33m"
BLUE = "\033[34m"
MAGENTA = "\033[35m"
CYAN = "\033[36m"
WHITE = "\033[37m"
DEFAULT="\033[0;39m"

input = %x{ps -arcwwwxo "command %cpu"}.split("\n")
counter, total = 0, 0

title = ARGV[0] == "-t" ? ARGV[1] : "Top CPU processes"
print "#{title}\n\n" unless ARGV[0] == "-t" && ARGV[1].nil?

input.each {|line|
	if line =~ /^(.*?)\s+(\d{1,3}[\.,]\d)$/
		exit if counter == 5 or total == 10
		score = $2.to_i
		color = case score
		   when 0..10 then DEFAULT
		   when 11..20 then CYAN
		   when 21..30 then YELLOW
		   when 30..200 then RED
		   else RED
		end

		puts "#{color}(#{$2})\t#{$1}\033[0m"

		counter += 1 if $2.to_i < 1
		total += 1
	end
}