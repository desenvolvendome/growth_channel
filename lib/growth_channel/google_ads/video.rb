module GoogleAds
  class Video

    def read_per_video
      videos_principais = []
      ManageCSV.read_csv_adsense.each do |row|
        views = row['Visualizações'].to_i
        cost = row['Custo'].sub(',', '.').to_f
        rdv25 = row['Reprod. do vídeo até 25%'].sub(',', '.').to_f
        rdv50 = row['Reprod. do vídeo até 50%'].sub(',', '.').to_f
        rdv75 = row['Reprod. do vídeo até 75%'].sub(',', '.').to_f
        rdv100 = row['Reprod. do vídeo até 100%'].sub(',', '.').to_f

        videos_principais.push({
                                   id_video: get_id_video(row),
                                   id_video_principal: get_id_video_principal(row),
                                   tags_campanha: get_tags_campanhas(row),
                                   views: views,
                                   cost: cost,
                                   watched_25: rdv25,
                                   watched_50: rdv50,
                                   watched_75: rdv75,
                                   watched_100: rdv100
                               })
      end
      videos_principais
    end

    def get_tags_campanhas(row)
      row['Campanha'].split(' ')
    end

    def get_id_video(row)
      get_tags_campanhas(row).first
    end

    def get_id_video_principal(row)
      get_id_video(row).split('.').first
    end

    def videos_principais_agrupados
      read_per_video.group_by { |h| h[:id_video_principal] }.values
    end
  end
end
