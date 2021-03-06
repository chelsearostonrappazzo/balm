# frozen_string_literal: true

require_relative "balm/version"

module Balm
  class Error < StandardError; end

  # this class will output random trope
  class Trope
    def initialize
      filename = "tropes.txt"
      @tropes = []
      File.readlines(filename).each do |trope|
        @tropes << trope.strip
      end
    end

    def self.romance
      puts @tropes.sample(1)
    end
  end
end

Balm::Trope.new
Balm::Trope.romance
