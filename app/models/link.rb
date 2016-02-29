class Link < ActiveRecord::Base
  belongs_to :user
  validates :url, :url => true

  def status
    if self.read?
      "read"
    else
      "unread"
    end
  end
end
