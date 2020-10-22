require_relative 'DistributedViews.rb'

_filepath = "Relatorio-de-Campanhas.csv"
    _distributedInfo = DistributedInfo.new
    
    _distributedInfo.csvUpload(_filepath)
    
    _data = _distributedInfo.getData()
    
    for _item in _data do
        puts "#{_item.getCampaign()} did #{_item.getViews()} views"
    end