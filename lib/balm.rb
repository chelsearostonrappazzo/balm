# frozen_string_literal: true

require_relative "balm/version"

module Balm
  class Error < StandardError; end

  # this class will generate aspects of a story: trope, archetype and setting
  class Plot
    class << self
      def trope
        tropes = []
        File.readlines("lib/balm/romance-tropes.txt").each { |trope|
          tropes << trope.strip
        }
        puts tropes.sample(1)
      end

      def archetype(num)
        archetypes = []
        File.readlines("lib/balm/archetypes.txt").each { |archetype|
          archetypes << archetype.strip
        }
        puts archetypes.sample(num).join(", ")
      end

      def setting
        settings = []
        File.readlines("lib/balm/settings.txt").each { |setting|
          settings << setting.strip
        }
        puts settings.sample
      end

      def all(num)
        archetype(num)
        trope
        setting
      end
    end
  end
end

Balm::Plot.all(3)
