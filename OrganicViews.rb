require 'csv'
class OrganicViews
    puts "Welcome! To read your file successfully, it must be in the same folder as the script!"
   
    begin
        print "Enter .CSV file name: "
        file = gets.strip + ".csv"   
        totalViews = 0;

        report = CSV.read(file)

        for element in report
            totalViews += element[8].to_i
        end

        print "Total number of organic views: " , totalViews , ". "

        rescue Errno::ENOENT
        puts 'The file name is incorrect or it is not in the same directory as the script!'        
    end
end