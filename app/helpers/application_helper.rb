module ApplicationHelper

# the navbar links within an event are different 
# from those on the global level
# e.g. <li><%= link_to "Hackers", nav_url_builder() %></li>

  def url_builder(bits)

  base =  '/events/' + params['id'] + '/' + params['event_name']
  base + bits
  
  end

  def prep_string_for_url(str)
    
    url_name = str.downcase
    url_name = url_name.gsub(/[^0-9A-Za-z\s]/, '')
    url_name.gsub(/\s+/, '-')

  end

  def rtag_path(tag)

    request.fullpath + 'tags/' + tag
  
  end

  end 
