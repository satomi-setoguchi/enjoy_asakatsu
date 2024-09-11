module RecordsHelper
  def color_of_active_day(record)
    if record.active_time >= 3 * 60 * 60
      return '#FF9B78'
    elsif record.active_time >= 2 * 60 * 60
      return '#FFB290'
    elsif record.active_time >= 1 * 60 * 60
      return '#FFC8A7'
    else
      return '#FFDFBE'
    end
  end
end
