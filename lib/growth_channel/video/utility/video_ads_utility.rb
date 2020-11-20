class VideoAdsUtility

  def self.get_reproduction_to_100_percent(row)
    row['Reprod. do vídeo até 100%'].sub(',', '.').to_f
  end

  def self.get_reproduction_to_75_percent(row)
    row['Reprod. do vídeo até 75%'].sub(',', '.').to_f
  end

  def self.get_reproduction_to_50_percent(row)
    row['Reprod. do vídeo até 50%'].sub(',', '.').to_f
  end

  def self.get_reproduction_to_25_percent(row)
    row['Reprod. do vídeo até 25%'].sub(',', '.').to_f
  end

  def self.get_custo(row)
    row['Custo'].sub(',', '.').to_f
  end

  def self.get_views(row)
    row['Visualizações'].to_i
  end

  def self.get_id_video_principal(id_video)
    id_video.split('.').first
  end

  def self.extract_id_video(tags_campanha)
    id_video = tags_campanha.first
    tags_campanha.shift
    id_video
  end

  def self.get_campanhas(row)
    row['Campanha'].split(' ')
  end

  #------------------------------
  #----group_main_video_info-----
  #------------------------------
  def self.get_cost_of_the_parts_the_video(video)
    video.inject(0) { |sum, hash| sum + hash[:cost] }
  end

  def self.get_sum_of_the_parts_the_video(video)
    video.inject(0) { |sum, hash| sum + hash[:views] }
  end

  def self.get_watched_100_of_parts_the_video(video)
    video.inject(0) { |sum, hash| sum + hash[:watched_100] }
  end

  def self.get_watched_75_of_parts_the_video(video)
    video.inject(0) { |sum, hash| sum + hash[:watched_75] }
  end

  def self.get_watched_50_of_parts_the_video(video)
    video.inject(0) { |sum, hash| sum + hash[:watched_50] }
  end

  def self.get_watched_25_of_parts_the_video(video)
    video.inject(0) { |sum, hash| sum + hash[:watched_25] }
  end
end