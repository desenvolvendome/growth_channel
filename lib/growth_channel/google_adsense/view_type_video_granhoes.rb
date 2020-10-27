require 'csv'

module GoogleAdSenses
    class View

        def initialize(file_path)
            @file_path = file_path
        end

        def total_views_per_garanhoes_videos
            total_views
        end

        def total_views
            read_views_garanhoes_videos.reduce(:+)
        end

        def validate_flag(string)
            new_string = string.strip.upcase

            new_string.include?"[G]"
        end

        def read_views_garanhoes_videos
            reports = CSV.read(@file_path, headers: true)
            views_list = []
            reports.each do |row|
                flag_video = row['Campanha'].split.last
                if validate_flag(flag_video)
                    view = row["Visualizações"].to_i
                    views_list.push(view)
                end
            end
            views_list
        end
    end
end