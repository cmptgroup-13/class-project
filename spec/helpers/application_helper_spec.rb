require "spec_helper"

RSpec.describe ApplicationHelper, :type => :helper do
  describe "#set_long_lat" do
    it "returns longitude and latitude" do
        expect(helper.set_long_lat).to eq("RSpec is your friend")
    end
  end
end