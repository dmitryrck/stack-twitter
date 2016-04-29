class Account
  include ActiveModel::Model

  attr_accessor :username, :tweets

  validates :username, presence: true

  def to_s
    username
  end
end
