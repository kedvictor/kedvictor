module ApplicationHelper
  
  def title
    title = @title || 'Wellcome'
    "Victor Kedyulich | #{title}"
  end
end
