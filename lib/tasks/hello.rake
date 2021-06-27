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

task :reenable do
  puts 'Reenable!'
  Rake::Task['invoke'].reenable
  Rake::Task['hello:world'].reenable
end

task :before do
  puts 'before task'
end

task :before2 do
  puts 'before task 2'
end

Rake::Task['hello:world'].enhance(%w[before]) do
  puts 'after task'
end

Rake::Task['hello:world'].enhance(%w[before2]) do
  puts 'after task 2'
end
