class StackOverflowService
  def initialize(user_id)
    @user_id = user_id
  end

  def get_badges
    Faraday.get("https://api.stackexchange.com/2.2/users/#{@user_id}/badges?order=desc&sort=rank&site=stackoverflow")
  end
end
