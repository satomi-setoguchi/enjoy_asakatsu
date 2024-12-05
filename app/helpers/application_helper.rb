module ApplicationHelper
  def page_title(title = '')
    base_title = 'Enjoy朝活'
    title.present? ? "#{title} | #{base_title}" : base_title
  end
end
