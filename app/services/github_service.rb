class GithubService
  def initialize(user_name)
    @user_name = user_name
  end

  def get_info
    Faraday.get("https://api.github.com/users/#{@user_name}")
  end
end
