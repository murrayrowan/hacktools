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

  def build_breadcrumb

    s = ""
    prev_level=''
    url = request.path.split('?')  #remove extra query string parameters
    levels = url[0].split('/') #break up url into different levels

    levels.each_with_index do |level, index|
      unless level.blank?

        name = level.gsub(/-/, ' ').capitalize.split.each { |x| print x.capitalize!, " "}.join(" ")

        if index == levels.size-1 || 
           (level == levels[levels.size-2] && levels[levels.size-1].to_i > 0)
          name = 'Tagged with "' + name + '"' if prev_level == 'tag'
          s += "<li>#{name}</li>\n" unless level.to_i > 0

        else
            link = "/"
            i = 1
            while i <= index
              link += "#{levels[i]}/"
              i+=1
            end
            # load s for printing the next link unless it's a number and therefore an id
            s += "<li><a href=\"#{link}\">#{name}</a><span class='divider'>/</span></li>\n" unless (level =~ /^\d+$/ || level == 'with' || level == 'tag')
            prev_level = level
        end
      end
    
    end
    raw s

  end
  
  # used for register/unregister for event buttons 
  def registered(user_attendances, current_event_id)
    user_attendances.each do |attendance|
      # user is attending this event 
      return attendance.id if attendance.event_id == current_event_id.to_i
    end
      # user is not attending this event
      return FALSE
  end

  # Closing END:
  end 
