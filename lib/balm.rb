# frozen_string_literal: true

require_relative "balm/version"

module Balm
  class Error < StandardError; end

  # this class will output random trope
  class Trope
    def self.romance
      @tropes = []
      File.readlines("lib/balm/romance-tropes.txt").each { |trope|
        @tropes << trope.strip
      }
      puts @tropes.sample(1)
    end
  end

  # this class will out put of character types based on input
  class Archetype
    def self.character(num)
      @archetypes = []
      File.readlines("lib/balm/archetypes.txt").each { |archetype| @archetypes << archetype.strip }
      puts @archetypes.sample(num)
    end
  end

  # this class will out put a setting time and place
  class Setting
    def self.where?
      @settings = []
      File.readlines("lib/balm/settings.txt").each { |setting|
        @settings << setting.strip
      }
    end
  end
end

Balm::Trope.romance
Balm::Archetype.character(2)
