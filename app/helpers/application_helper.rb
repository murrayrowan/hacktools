module ApplicationHelper

# the navbar links within an event are different 
# from those on the global level
# e.g. <li><%= link_to "Hackers", nav_url_builder() %></li>

  def nav_url_builder
    
    uri_base = 'http://' + request.env["HTTP_HOST"]

    # if the url path starts with '/events'
    # return the path with /events/id in it
    if /^\/events/ =~ request.fullpath
      uri_base + '/events' + '/' + params['id']
    else
    # else just return an empty string, 
    # which is effectively the same as url_base anyway
      '' 
    end

  end

end
