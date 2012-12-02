module ApplicationHelper
  def title
    title = @title || 'Wellcome'
    "Kedyulich Victor | #{title}"
  end
end
