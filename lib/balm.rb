# frozen_string_literal: true

require_relative "balm/version"

module Balm
  class Error < StandardError; end

  # this class will generate aspects of a story: trope, archetype and setting
  class Plot
    class << self
      def trope
        tropes = []
        File.readlines("bin/romance-tropes.txt").each do |trope|
          tropes << trope.strip
        end
        puts tropes.sample(1)
      end

      def archetype(num)
        archetypes = []
        File.readlines("bin/archetypes.txt").each do |archetype|
          archetypes << archetype.strip
        end
        puts archetypes.sample(num).join(", ")
      end

      def setting
        settings = []
        File.readlines("bin/settings.txt").each do |setting|
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
