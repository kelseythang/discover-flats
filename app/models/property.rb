class Property < ApplicationRecord
  has_many :images

  # formats phone_number
  def phone_number
    self.phone_number_unformatted.insert(0, '(').insert(4, ')').insert(5,' ').insert(9,'-')
  end
  
  # compiles full address
  def full_address
    if self.address_line_two.nil? 
      "#{self.address_line_one}, #{self.city}, #{self.state} #{self.zip}"
    else
      "#{self.address_line_one} #{self.address_line_two}, #{self.city}, #{self.state} #{self.zip}"
    end
  end

end
