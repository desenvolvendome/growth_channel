require 'csv'
class OrganicViews
    totalViews = 0;

    report = CSV.read("organicViewsReport.csv")

    for element in report
        totalViews += element[8].to_i
    end  

    puts "Total number of organic views: " , totalViews

end
