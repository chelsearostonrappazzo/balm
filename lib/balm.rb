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
        tropes.sample
      end

      def archetype(num)
        archetypes = []
        archetype_data = File.join(File.dirname(__FILE__), "archetypes.yaml")
        YAML.load_file(archetype_data).each do |archetype|
          archetypes << archetype.strip
        end
        if num === 1
          archetypes.sample(num)[0]
        elsif num === 2
          archetypes.sample(num).join(" and ")
        elsif num >= 3
          archetypes_list = archetypes.sample(num)
          archetypes_list[-1] = "and " + archetypes_list[-1] 
          archetypes_list.join(", ")
        end
      end

      def setting
        setting_data = File.join(File.dirname(__FILE__), "settings.yaml")
        settings = []
        YAML.load_file(setting_data).each do |setting|
          settings << setting.strip
        end
        settings.sample
      end

      def all(num, type = "list")
        if type === "prompt"
          if trope.downcase.end_with?("!")
            if setting.downcase.start_with?(/[io]+/)
              "Once upon a time, a #{archetype(num)} are #{setting.downcase} and #{trope.downcase} Have you found your path?"
            else
              "Once upon a time, a #{archetype(num)} are in #{setting.downcase} and #{trope.downcase} Have you found your path?"
            end
          else
            if setting.downcase.start_with?(/[io]+/)
              "Once upon a time, a #{archetype(num)} are #{setting.downcase} and #{trope.downcase}. Have you found your path?"
            elsif setting.downcase.start_with?("as")
              "Once upon a time, a #{archetype(num)} #{setting.downcase} and #{trope.downcase}. Have you found your path?"
            else
              "Once upon a time, a #{archetype(num)} are in #{setting.downcase} and #{trope.downcase}. Have you found your path?"
            end
          end
        else
          prompt_list = { trope: trope, archetypes: archetype(num), setting: setting }
          prompt_list
        end
      end
    end
  end
end