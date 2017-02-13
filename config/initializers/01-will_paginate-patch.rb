class Flickr::Photos::PhotoResponse
  def total_pages
    pages
  end

  def total_pages=(pages)
    pages = pages
  end

  def current_page
    page
  end
end
