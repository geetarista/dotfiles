require 'rake'
 
desc "Create all links to dotfiles"
task :install do
  Dir['*'].each do |file|
    next if %w[Rakefile README.rdoc LICENSE].include? file
    
    if File.exist?(File.join(ENV['HOME'], ".#{file}"))
      system %Q{rm "$HOME/.#{file}"}
    end
    system %Q{ln -s "$PWD/#{file}" "$HOME/.#{file}"}
    system %Q{echo "Linked ~/.#{file} to $PWD/.#{file}"}
  end
end
