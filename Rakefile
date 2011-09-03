DIR = File.dirname(__FILE__)
def plugins
  File.read(DIR + '/plugins.txt').split("\n")
end

desc "Clone plugins into ~/.vim/plugins"
task :git_clone do
  plugins.each do |plugin|
    name = plugin[/([^\/]+).git/, 1].downcase
    sh "git clone #{plugin} #{DIR}/plugins/#{name}"
  end 
end

desc "Update git plugins"
task :git_update do
  abort "First run `rake install`" if !File.exists?("#{DIR}/plugins")

  plugins.each do |plugin|
    sh "cd #{DIR}/plugins/#{plugin}; git pull"
  end
end

task :get_pathogen do
  url = "https://raw.github.com/tpope/vim-pathogen/HEAD/autoload/pathogen.vim"
  sh "curl #{url} > #{DIR}/autoload/pathogen.vim"
end

desc "First time install downloads plugins, saves your old vim config and symlinks new one"
task :install => [:get_pathogen, :git_clone] do
  require 'fileutils'
  home = File.expand_path('~')

  %W{#{home}/.vim #{home}/.vimrc}.each do |path|
    FileUtils.mv path, "#{path}.old" if File.exists?(path)
  end

  FileUtils.ln_s DIR, "#{home}/.vim", :verbose => true if DIR != "#{home}/.vim"
  FileUtils.ln_s "#{DIR}/vimrc", "#{home}/.vimrc", :verbose => true
end

desc "Update pathogen and plugins"
task :update => [:get_pathogen, :git_update]

task :default => :update
