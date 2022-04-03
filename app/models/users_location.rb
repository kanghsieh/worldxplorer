class UsersLocation < ApplicationRecord
  belongs_to :user
  belongs_to :location, dependent: :destroy
  ### should add inclusion of wished and visited to be only true or false ###

  def self.visited
    where(visited: true)
  end

  def self.wished
    where(wished: true)
  end
end
