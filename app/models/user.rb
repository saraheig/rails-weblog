class User < ApplicationRecord
  has_secure_password
  validates :password, length: { minimum: 8 }

  def display_name
    if admin?
      "#{name} (admin)"
    else
      name
    end
  end
end
