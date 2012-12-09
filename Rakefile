desc "run app w/ shotgun"
task :run do
  sh "shotgun app.rb"
end

desc "compile coffee scripts"
task :compile do
  require 'coffee-script'
  FileList['public/*.coffee'].each do |f|
    sh "coffee -c #{f}"
  end
end

desc "alias to :compile"
task :c => :compile

