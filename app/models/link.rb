class Link < ActiveRecord::Base
  validates :url, :url => true

  def status
    if self.read?
      "read"
    else
      "unread"
    end
  end
end
