require 'growth_channel/youtube/view'

RSpec.describe "Youtube::View" do

  it "count views" do
    total_views = Youtube::View.new("spec/suports/report_youtube_sample.csv").count

    expect(total_views).to eq(283 + 930 + 537 + 154 + 67 + 13 + 85)
  end

end
