module Admin::ReservationsHelper

#  def show(show)
#    show
#  end

#  def show_title(custom_title, default_title)
#    content_tag("strong", (custom_title ? "#{custom_title}: " : "#{default_title}: "))
#  end

  def show_title(show, title, field)
    if show == true
      a = content_tag("strong", title)
      b = field
      return a, b
      content_tag("br")
    end
  end

end

#<% if @event.date_title_show == true -%>
#  <%= show_title(@event.date_title, "Date") %>
#  <%=h @reservation.date %>
#<% end -%>

