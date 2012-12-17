# def winner(n)
# 	choices = find_choices(n)
# 	puts choices
# 	!choices.empty? && choices.all? {|k| !winner(n - 2**k)}
# end

# def find_choices(n)
# 	upper_bound = Math.log2(n).to_i
# 	choices_array = (0..upper_bound).to_a
# 	choices_array.select{|k| beauty_difference(n, n-2**k) == 0}
# end

# def beauty_difference(x, y)
# 	(x.to_s(2).count('1') - y.to_s(2).count('1')).abs
# end

def move_count(n)
	move_count = 0
	zero_count = 0
	while (n != 0)
		if (n & 1 == 1)
			move_count += zero_count
		else
			zero_count += 1
		end
		n = n >> 1
	end
	move_count
end

# j = gets.chomp.to_i
# j.times do
# 	n = gets.chomp.to_i
# 	puts winner(n) ? 'First Player' : 'Second Player'
# end

# [1,2,8,16,42,1000,123].each { |x| puts winner(x) ? 'First Player' : 'Second Player' }
[1,2,8,16,42,1000,123].each { |n| 
	puts move_count(n).odd? ? 'First Player' : 'Second Player'
}

# puts winner(2).even? ? 'First Player' : 'Second Player'