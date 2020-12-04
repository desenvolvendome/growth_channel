require 'growth_channel/youtube/most_engajament'

RSpec.describe "Youtube::Engajament" do

  context "count" do

    it "total_engajament" do
      total_enganjament = Youtube::Engajament.new.total_enganjament()
      result = [
        {id_video_principal: 'v7', total: 391},
        {id_video_principal: 'v18', total: 0},
    ]
      expect(total_enganjament.first).to eq(result.first)
      expect(total_enganjament.last).to eq(result.last)
    end

  end


end
