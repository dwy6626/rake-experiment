# frozen_string_literal: true

namespace :hello do
  desc 'print hello world'
  task world: %w[hello:man hello:earth] do
    puts 'Hello, world!'
  end

  task earth: %w[hello:man] do
    puts 'Hello, Earth~'
  end

  task :man do
    puts 'Hello, man.'
  end
end

task :invoke do
  Rake::Task['hello:world'].invoke
end

task :execute do
  Rake::Task['hello:world'].execute
end
