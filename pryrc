# http://lucapette.com/pry/pry-everywhere/

Pry.config.editor = "gvim --nofork"
Pry.config.pager = false
Pry.config.hooks.add_hook(:after_session, :say_bye) do
  puts "bye-bye"
end

# Prompt with ruby version
Pry.prompt = [proc { |obj, nest_level| "#{RUBY_VERSION} (#{obj}):#{nest_level} > " }, proc { |obj, nest_level| "#{RUBY_VERSION} (#{obj}):#{nest_level} * " }]

%w{map_by_method hirb pry-editline}.each { |gem| begin; require gem; rescue LoadError => e; puts e.inspect; end }

# Toys methods
# Stealed from https://gist.github.com/807492
class Array
  def self.toy(n=10, &block)
    block_given? ? Array.new(n,&block) : Array.new(n) {|i| i+1}
  end
end

class Hash
  def self.toy(n=10)
    Hash[Array.toy(n).zip(Array.toy(n){|c| (96+(c+1)).chr})]
  end
end

cs=Pry::CommandSet.new do
  import Pry::Commands
  command "lm","Alias for ls -m" do |args|
   run "ls", "-m #{args}"
  end
  command "lM", "Alias for ls -M" do |args|
   run "ls", "-M #{args}"
  end
end

# loading rails configuration if it is running as a rails console
load File.dirname(__FILE__) + '/.railsrc' if defined?(Rails) && Rails.env
