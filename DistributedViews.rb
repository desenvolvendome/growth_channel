require 'csv'
require_relative 'models/AdVideo.rb'
class DistributedInfo
    @data

    def initialize ()
        @data = Array.new
    end
    
    def getData
        return @data
    end
    
    def csvUpload(_filepath)
        begin
            _reports = CSV.read(_filepath)
            _first = true
            for _element in _reports do
                if _first == true
                    _first = false
                else
                    _campaign = _element[0]
                    _views = _element[1].to_i
                    @data << AdVideo.new(_campaign,_views) 
                    
                end
            end
        rescue => exception
            puts exception
        end

    end

end
