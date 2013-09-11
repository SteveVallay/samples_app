module UsersHelper
  def gravata_for (user, options = { size: 50})
    size = options[:size]
    gravata_id = Digest::MD5::hexdigest(user.email.downcase)
    gravata_url = "https://secure.gravatar.com/avatar/#{gravata_id}?s=#{size}"
    image_tag gravata_url, alt: user.name, class: "gravata"
  end
end
