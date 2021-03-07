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
        YAML.load_file(trope_data).each { |trope|
          tropes << trope.strip
        }
        puts tropes.sample
      end

      def archetype(num)
        archetypes = []
        archetype_data = YAML.load_file("lib/archetypes.yaml")
        archetype_data.each { |archetype| archetypes << archetype.strip }
        if (1..5).include?(num)
          puts archetypes.sample(num).join(", ")
        elsif num < 1
          puts archetypes.sample(1)
        else
          puts archetypes.sample(5).join(", ")
        end
      end

      def setting
        settings = []
        setting_data = YAML.load_file("lib/settings.yaml")
        setting_data.each { |setting| settings << setting.strip }
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

Balm::Plot.trope
