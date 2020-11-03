require_relative 'DistributedViews.rb'
require 'growth_channel/util/manage_csv'

@@report = ManageCSV.read_csv_adsense

    _distributedInfo = DistributedInfo.new
    
    _distributedInfo.csvUpload(@@report)
    
    _data = _distributedInfo.getData()
    
    for _item in _data do
        puts "#{_item.getCampaign()} did #{_item.getViews()} views"
    end