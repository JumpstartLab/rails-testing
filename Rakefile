#!/usr/bin/env rake
# Add your own tasks in files placed in lib/tasks ending in .rake,
# for example lib/tasks/capistrano.rake, and they will automatically be available to Rake.

require File.expand_path('../config/application', __FILE__)

Blogger::Application.load_tasks

namespace :tags do
  desc "List all tags"
  task :list => :environment do
    puts Tag.all.map {|tag| tag.name }.join(", ")
  end
end

