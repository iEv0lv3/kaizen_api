class StackOverflowService
  def initialize(user_id)
    @user_id = user_id
  end

  def get_badges
    conn = Faraday.new("https://api.stackexchange.com/2.2/users/#{@user_id}/badges?order=desc&sort=rank&site=stackoverflow")

    conn.get
  end
end
