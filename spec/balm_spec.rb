# frozen_string_literal: true

require "balm"

RSpec.describe Balm do
  it "has a version number" do
    expect(Balm::VERSION).not_to be nil
  end

  # it "populates a trope" do
  #   expect(Balm::Plot.archetype).to eq(true)
  # end
end
