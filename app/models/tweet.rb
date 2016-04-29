class Tweet
  include ActiveModel::Model

  attr_accessor :created_at, :text

  def to_s
    text
  end
end
