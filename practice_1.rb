require 'optparse'
opt = OptionParser.new
params={}
opt.on('-m') {|v| params[:m] = v }
opt.on('-y') {|v| params[:y] = v }
end

opt.parse! (ARGV)
p (ARGV)
