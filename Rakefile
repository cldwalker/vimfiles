require 'fileutils'
DIR = File.dirname(__FILE__)

def plugins
  File.read(DIR + '/plugins.txt').split("\n")
end

def save_plugins(plugins)
  File.open("#{DIR}/plugins.txt", 'w+') {|f| f.write plugins.join("\n") }
end

def translate_plugin(name)
  name[%r{^[^/]+/[^/]+$}] ? "git://github.com/#{name}.git" : name
end

def plugin_name(repo)
  repo[/([^\/]+).git$/, 1].downcase
end

def install_plugin(repo)
  sh "git clone #{repo} #{DIR}/plugins/#{plugin_name(repo)}"
end

def update_docs
  system "vim -e -s <<-EOF\n:Helptags\n:quit\nEOF"
end

desc "Clone plugins into ~/.vim/plugins"
task :git_clone do
  plugins.each {|plugin| install_plugin(plugin) }
end

desc "Update git plugins"
task :git_update do
  abort "First run `rake install`" if !File.exists?("#{DIR}/plugins")

  plugins.each do |plugin|
    dir = "#{DIR}/plugins/#{plugin_name(plugin)}"
    File.directory?(dir) ?  sh("cd #{dir}; git pull") :
      install_plugin(plugin)
  end
end

task :get_pathogen do
  url = "https://raw.github.com/tpope/vim-pathogen/HEAD/autoload/pathogen.vim"
  sh "curl #{url} > #{DIR}/autoload/pathogen.vim"
end

desc "First time install downloads plugins, saves your old vim config and symlinks new one"
task :install => [:get_pathogen, :git_clone, :update_docs] do
  home = File.expand_path('~')

  %W{#{home}/.vim #{home}/.vimrc}.each do |path|
    FileUtils.mv path, "#{path}.old" if File.exists?(path)
  end

  FileUtils.ln_s DIR, "#{home}/.vim", :verbose => true if DIR != "#{home}/.vim"
  FileUtils.ln_s "#{DIR}/vimrc", "#{home}/.vimrc", :verbose => true
end

desc "Update pathogen and plugins"
task :update => [:get_pathogen, :git_update, :update_docs]

task(:update_docs) { update_docs }

desc "Add a vim plugin with PLUGIN=GIT_REPO"
task :add do
  repo = translate_plugin ENV['PLUGIN'] || abort("No plugin given")
  install_plugin repo
  save_plugins plugins << repo
  update_docs
end

desc "Remove a plugin with PLUGIN=GIT_REPO"
task :rm do
  repo = translate_plugin ENV['PLUGIN'] || abort("No plugin given")
  FileUtils.rm_rf "#{DIR}/plugins/#{plugin_name(repo)}", :verbose => true
  save_plugins plugins.tap {|ps| ps.delete repo }
end

task :default => :update
