class Video < ActiveRecord::Base
  attr_accessible :allow_comments, :description, :source, :title

  def to_param
    title
  end
end
