# frozen_string_literal: true

require_relative "balm/version"
require "yaml"

module Balm
  class Error < StandardError; end

  # this class will generate aspects of a story: trope, archetype and setting
  class Plot
    class << self
      def trope
        trope_data = File.join(File.dirname(__FILE__), "tropes.yaml")
        tropes = []
        YAML.load_file(trope_data).each do |trope|
          tropes << trope.strip
        end
        puts tropes.sample
      end

      def archetype(num)
        archetypes = []
        archetype_data = File.join(File.dirname(__FILE__), "archetypes.yaml")
        YAML.load_file(archetype_data).each do |archetype|
          archetypes << archetype.strip
        end
        if (1..5).include?(num)
          puts archetypes.sample(num).join(", ")
        elsif num > 5
          puts archetypes.sample(5).join(", ")
        end
      end

      def setting
        setting_data = File.join(File.dirname(__FILE__), "settings.yaml")
        settings = []
        YAML.load_file(setting_data).each do |setting|
          settings << setting.strip
        end
        puts settings.sample
      end

      def all(num)
        puts "~Characters~"
        archetype(num)
        puts "~Trope~"
        trope
        puts "~Setting~"
        setting
      end
    end
  end
end
