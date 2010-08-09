module Admin::ReservationsHelper

  def show_title(show, title, field)
    if show == true
      a = content_tag("strong", title)
      b = field
      return a, b
      content_tag("br")
    end
  end

end

