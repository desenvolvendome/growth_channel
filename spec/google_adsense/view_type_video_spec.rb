require 'growth_channel/google_adsense/view_type_video_idea'

RSpec.describe "GoogleAdSense::View" do

  context "View per type video idea" do

    it "total_views_per_idea_videos" do
      type_idea = GoogleAdSense::View.new("spec/suports/Relatorio_de_Campanhas.csv").total_views_per_idea_videos
    expect(type_idea).to eq("Idea videos: 856")

    end
  end
end
