class Item < ApplicationRecord
  belongs_to :merchant

  def find_by_name(name)
    find_by(name: name)
  end
end
