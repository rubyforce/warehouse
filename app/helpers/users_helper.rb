module UsersHelper
  def profile_user_json(user)
    json = user.as_json(only: [:id, :facebook_link, :twitter_link, :google_plus_link, :linkedin_link], methods: :profile_image)
    json.to_json
  end
end

