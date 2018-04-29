module NavigationHelpers

  def path_to(page_name)
    case page_name

    when /^the home\s?page$/
      '/'

      when /^the RubyGG home page$/
        '/'
      when /^"(.*)"'s summoner page$/i
        summoner_show_path($1)
      when /^my favorite summoners page$/
        summoner_favorites_index_path
      when /^the login page$/
        '/auth/index'
      when /^the signup page$/
        '/users/new'

    else
      begin
        page_name =~ /^the (.*) page$/
        path_components = $1.split(/\s+/)
        self.send(path_components.push('path').join('_').to_sym)
      rescue NoMethodError, ArgumentError
        raise "Can't find mapping from \"#{page_name}\" to a path.\n" +
          "Now, go and add a mapping in #{__FILE__}"
      end
    end
  end
end

World(NavigationHelpers)
