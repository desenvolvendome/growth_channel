require 'growth_channel/util/manage_csv'

RSpec.describe "ManageCSV" do

    it "is valid when the video format is correct" do
        expect {ManageCSV.read_csv_youtube}.not_to raise_error
    end
end


