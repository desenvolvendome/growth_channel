RSpec.describe "Youtube::Engagement" do

  context "count" do

    it "ordered_most_engagement" do
      ordered_most_engagement = Youtube::Engagement.new.ordered_most_engagement

      result = [
        {id_video_principal: "v7", total: 391},
        {id_video_principal: "v18", total: 0}
      ]

      expect(ordered_most_engagement.first).to eq(result.first)
      expect(ordered_most_engagement.last).to eq(result.last)
    end

  end

end