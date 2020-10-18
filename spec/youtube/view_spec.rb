require 'growth_channel/youtube/view'

RSpec.describe "Youtube::View" do

  it "count views" do
    count = Youtube::View.new.read

    expect(count).to eq(283+930+537+154+67+13+85)
  end

end
