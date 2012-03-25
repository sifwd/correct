module UsersHelper
  def gravatar_for(user, options = { :size => 96 } )
    gravatar_id = Digest::MD5::hexdigest(user.email.downcase)
    gravatar_url = "http://gravatar.com/avatar/#{gravatar_id}.png?s=#{options[:size]}"
    image_tag(gravatar_url, alt: h(user.name), class: "gravatar")
  end
end
