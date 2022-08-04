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
        return tropes.sample
      end

      def archetype(num)
        archetypes = []
        archetype_data = File.join(File.dirname(__FILE__), "archetypes.yaml")
        YAML.load_file(archetype_data).each do |archetype|
          archetypes << archetype.strip
        end
        if num === 1
          return archetypes.sample(num)
        elsif num === 2
          return archetypes.sample(num).join(" and ")
        elsif num >= 3
          archetypes_list = archetypes.sample(num)
          archetypes_list[-1] = "and " + archetypes_list[-1] 
          return archetypes_list.join(", ")
        end
      end

      def setting
        setting_data = File.join(File.dirname(__FILE__), "settings.yaml")
        settings = []
        YAML.load_file(setting_data).each do |setting|
          settings << setting.strip
        end
        return settings.sample
      end

      def all(num)
          return "Once upon a time, a #{archetype(num)} in a #{setting} and #{trope} happens. Have you found your path?"
      end
    end
  end
end