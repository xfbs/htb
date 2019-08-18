puts ARGV[0].scan(/../).map{|n| n.to_i(16).chr}.join
