class Realtor < ApplicationRecord
  def self.search_by_first_name(first_name)
    if first_name.present?
      where("first_name ILIKE ?", "%#{first_name}%")
    else
      all
    end
  end
end
