class Advideo
    @campaign
    @views

    def initialize(_campaign, _views)
        @campaign = _campaign
        @views = _views
    end

    def getCampaign
        return @campaign
    end

    def getViews
        return @views
    end
end