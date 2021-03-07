# frozen_string_literal: true

require "bundler/gem_tasks"
Bundler.require(:default, :development)
require "rspec/core/rake_task"

RSpec::Core::RakeTask.new(:spec)

require "rubocop/rake_task"

RuboCop::RakeTask.new

task default: %i[spec rubocop]
