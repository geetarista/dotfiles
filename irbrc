#!/usr/bin/ruby

%w(rubygems hpricot irb/ext/save-history open-uri what_methods wirble bond).each { |x| begin; require x; rescue LoadError => e; puts e.inspect; end }

Bond.start

Wirble.init
Wirble.colorize
 
ARGV.concat [ "--readline", "--prompt-mode", "simple" ]
IRB.conf[:SAVE_HISTORY] = 1000
IRB.conf[:HISTORY_FILE] = "#{ENV['HOME']}/.irb_history"

IRB.conf[:PROMPT_MODE] = :SIMPLE
IRB.conf[:AUTO_INDENT] = true
IRB.conf[:USE_READLINE] = true
 
class Object
  # list methods which aren't in superclass
  def local_methods(obj = self)
    (obj.methods - obj.class.superclass.instance_methods).sort
  end
  
  # print documentation
  #
  # ri 'Array#pop'
  # Array.ri
  # Array.ri :pop
  # arr.ri :pop
  def ri(method = nil)
    unless method && method =~ /^[A-Z]/ # if class isn't specified
      klass = self.kind_of?(Class) ? name : self.class.name
      method = [klass, method].compact.join('#')
    end
    puts `ri '#{method}'`
  end
end
 
def copy(str)
  IO.popen('pbcopy', 'w') { |f| f << str.to_s }
end
 
def paste
  `pbpaste`
end
 
load File.dirname(__FILE__) + '/.railsrc' if $0 == 'irb' && ENV['RAILS_ENV']

# print SQL to STDOUT
if ENV.include?('RAILS_ENV') && !Object.const_defined?('RAILS_DEFAULT_LOGGER')
  require 'logger'
  RAILS_DEFAULT_LOGGER = Logger.new(STDOUT)
end
 
# Easily print methods local to an object's class
class Object
  def local_methods
    (methods - Object.instance_methods).sort
  end
end

# add ~/.ruby to the library search path
$LOAD_PATH << File.expand_path('~/.ruby')
 
class Object
  # print documentation
  #
  # ri 'Array#pop'
  # Array.ri
  # Array.ri :pop
  # arr.ri :pop
  def ri(method = nil)
    unless method && method =~ /^[A-Z]/ # if class isn't specified
      klass = self.kind_of?(Class) ? name : self.class.name
      method = [klass, method].compact.join('#')
    end
    puts `ri '#{method}'`
  end
  
  def non_class_methods
    self.methods - Class.methods
  end
end

module Kernel
  { :h => :Hpricot,
    :r => :require,
    :x => :exit
  }.each { |n,o| alias_method n, o }
end
 
# Originally inspired by http://ozmm.org/posts/railsrc.html
# File.readlink used because I keep my actual files in a project somewhere and symlink the user dotfile.
load File.readlink(File.expand_path("~/.railsrc")) if ENV['RAILS_ENV']
 
# Project-specific .irbrc
# if Dir.pwd != File.expand_path("~") and File.exist?(".irbrc")
#   puts "Loading #{File.expand_path '.irbrc'}"
#   load ".irbrc"
# end
 
# http://blog.evanweaver.com/articles/2006/12/13/benchmark/
def benchmark(times = 1000, samples = 20)
  times *= samples
  cur = Time.now
  result = times.times { yield }
  print "#{cur = (Time.now - cur) / samples.to_f } seconds"
  puts " (#{(cur / $last_benchmark * 100).to_i - 100}% change)" rescue puts ""
  $last_benchmark = cur
  result
end

module Kernel
  def r(arg)
    puts `refe #{arg}`
  end
  private :r
end
 
class Module
  def r(meth = nil)
    if meth
      if instance_methods(false).include? meth.to_s
        puts `refe #{self}##{meth}`
      else
        super
      end
    else
      puts `refe #{self}`
    end
  end
end
 
# Profile the provided block
def profile
  require 'profiler'
  Profiler__.start_profile
  yield
  Profiler__.stop_profile
  Profiler__.print_profile($stdout)
end

alias :quit :exit
 
def ri arg
  puts `ri #{arg}`
end
 
def cheat arg
  puts `cheat #{arg}`
end
 
if ENV['RAILS_ENV']
  def sql(query_string)
    ActiveRecord::Base.connection.select_all(query_string)
  end
  unless Object.const_defined?('RAILS_DEFAULT_LOGGER')
    require 'logger'
    RAILS_DEFAULT_LOGGER = Logger.new(STDOUT)
  end
end
 
class Object
  def local_methods
    self.methods.sort - self.class.superclass.instance_methods
  end
  
  def list_methods
    inspectee = self.class == Class ? self : self.class
    c_list = (inspectee.methods - Object.methods).sort
    i_list = (inspectee.instance_methods - Object.instance_methods).sort
    a_list = inspectee.class.ancestors
    puts "Class Methods", "-"*13, c_list.inspect, '' unless c_list.empty?
    puts "Instance Methods", "-"*16, i_list.inspect, '' unless i_list.empty?
    puts "Ancestors", "-"*9, a_list.inspect, '' unless a_list.empty?
  end
end
