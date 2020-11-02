require 'growth_channel/google_adsense/view_type_video_idea'
require 'growth_channel/google_adsense/view_type_video_granhoes'

RSpec.describe "GoogleAdSense::View" do

  context "View per type video idea" do

    it "total_views_per_idea_videos" do
      type_idea = GoogleAdSense::View.new.total_views_per_idea_videos
    expect(type_idea).to eq(8198)

    end
  end

  context "View per type video Garanhões" do

    it "total_views_per_garanhoes_videos" do
      type_garanhoes = GoogleAdSenses::View.new.total_views_per_garanhoes_videos
    expect(type_garanhoes).to eq(10861)

    end
  end

end
