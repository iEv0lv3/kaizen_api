class StackOverflowService
  def initialize(user_id, so_token)
    @so_token = so_token
    @user_id = user_id
  end

  def get_badges
    conn = Faraday.new("https://api.stackexchange.com/2.2/me/badges?order=desc&sort=rank&site=stackoverflow") do |f|
      f.headers['Authorization'] = "token #{@so_token}"
    end

    conn.get
  end
end
