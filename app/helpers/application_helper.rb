module ApplicationHelper
  def current?(path)
    current_page?(path) ? 'active' : ''
  end

  def user_nav_state
    if user_signed_in?
      {
        text: gravatar_for(current_user, size: 24), path: '#', class: 'avator',
        children: { menu1: { text: '修改密码', path: edit_registration_path(:user) },
                    menu2: { text: '登出', path: destroy_user_session_path, method: 'delete' }
                  }
      }
    else
      { text: '登入', path: new_session_path(:user) }
    end
  end

  def navigation_data
    {
      home: { text: '首页', path: root_path },
      apps: { text: 'App', path: root_path },
      posts: { text: '评测', path: posts_path },
      users: user_nav_state
    }
  end

  def render_navigation_bar
    bar_array = []

    navigation_data.each do |_route_key, data|
      if data[:path].to_s == '#'
        bar_array << "<li role='presentation'
            class='dropdown'>
            <a class='dropdown-toggle #{data[:class] if data[:class].present? }' data-toggle='dropdown' href='#' role='button'>
        #{data[:text]}<span class='caret'></span></a><ul class='dropdown-menu'>"

        data[:children].each do |_sub_key, sub_data|
          bar_array <<
          "<li class='#{current?(sub_data[:path])}'>
                  <a data-method='#{sub_data[:method] if sub_data[:method].present? }' href='#{sub_data[:path]}'>#{sub_data[:text]}</a>
              </li>"
        end
        bar_array << '</ul>'
      else
        bar_array << "<li role='presentation'
            class='#{current?(data[:path])}'>
            <a href='#{data[:path]}'>#{data[:text]}</a>
            </li>"
      end
    end

    bar_array.join('')
  end

  def bootstrap_flash_class(flash_type)
    { success: 'alert-success',
      error:   'alert-danger',
      alert:   'alert-warning',
      notice:  'alert-info'
    }[flash_type.to_sym] || flash_type.to_s
  end

  def gravatar_for(user, options = { size: 80 })
    gravatar_id = Digest::MD5::hexdigest(user.email.downcase)
    size = options[:size]
    gravatar_url = "https://secure.gravatar.com/avatar/#{gravatar_id}?s=#{size}"
    image_tag(gravatar_url, alt: user.nickname, class: "gravatar")
  end

end
