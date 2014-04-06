class Video < ActiveRecord::Base
  attr_accessible :allow_comments, :description, :source, :title

  validates_presence_of :title, :description, :source
  validates_uniqueness_of :source

  def to_param
    "#{id}-#{title.parameterize}"
  end
end
