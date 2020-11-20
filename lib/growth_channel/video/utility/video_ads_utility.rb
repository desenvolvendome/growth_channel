class VideoAdsUtility

  def self.get_reproduction_to_100_percent(row)
    rdv100 = row['Reprod. do vídeo até 100%'].sub(',', '.').to_f
  end

  def self.get_reproduction_to_75_percent(row)
    rdv75 = row['Reprod. do vídeo até 75%'].sub(',', '.').to_f
  end

  def self.get_reproduction_to_50_percent(row)
    rdv50 = row['Reprod. do vídeo até 50%'].sub(',', '.').to_f
  end

  def self.get_reproduction_to_25_percent(row)
    rdv25 = row['Reprod. do vídeo até 25%'].sub(',', '.').to_f
  end

  def self.get_custo(row)
    row['Custo'].sub(',', '.').to_f
  end

  def self.get_views(row)
    views = row['Visualizações'].to_i
  end

  def self.get_id_video_principal(id_video)
    id_video_principal = id_video.split('.').first
  end

  def self.extract_id_video(tags_campanha)
    id_video = tags_campanha.first
    tags_campanha.shift
    id_video
  end

  def self.get_campanhas(row)
    tags_campanha = row['Campanha'].split(' ')
  end
end