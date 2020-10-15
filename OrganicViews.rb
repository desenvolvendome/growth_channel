require 'csv'
class OrganicViews
    puts "Welcome! To read your file successfully, it must be in the same folder as the script!"
   
    puts "Enter .CSV file name:"
    file = gets.strip + ".csv"

    totalViews = 0;

    report = CSV.read(file)

    for element in report
        totalViews += element[8].to_i
    end  

    puts "Total number of organic views: " , totalViews

end
