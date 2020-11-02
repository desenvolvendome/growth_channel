require 'growth_channel/youtube/organic_views'

RSpec.describe "OrganicViews::View" do

  context "count" do

    it "total_views_per_video" do
      total_views_per_video = OrganicViews::View.new.total_views_per_video
      result = [
          {id_main_video: "v1.0", views: 283},
          {id_main_video: "v10.0", views: 537},
          {id_main_video: "v11.0", views: 586},
          {id_main_video: "v12.0", views: 551},
          {id_main_video: "v13.0", views: 529},
          {id_main_video: "v14.0", views: 551},
          {id_main_video: "v15.0", views: 504},
          {id_main_video: "v16.0", views: 503},
          {id_main_video: "v17.0", views: 213},
          {id_main_video: "v18.0", views: 1},
          {id_main_video: "v2.0", views: 226},
          {id_main_video: "v3.0", views: 84},
          {id_main_video: "v4.0", views: 100},
          {id_main_video: "v5.0", views: 117},
          {id_main_video: "v6.0", views: 4270},
          {id_main_video: "v7.0", views: 2380},
          {id_main_video: "v8.0", views: 664},
          {id_main_video: "v9.0", views: 614}
        ]
      expect(total_views_per_video).to eq(result)
    end
  end
end
