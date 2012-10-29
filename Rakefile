require 'bundler/gem_tasks'

task default: :try

task :try do
  sh 'cd best_quotes && bundle exec rake'
end

task :gem do
  sh 'git add .'
  sh 'rm *.gem'
  sh 'gem build *.gemspec'
  sh 'gem install *.gem'
end
