class Account < ActiveRecord::Base
  include BCrypt

  def password
    if hashed_password
      @password ||= Password.new(hashed_password)
    end
  end

  def password=(new_password)
    @password = Password.create(new_password)
    self.hashed_password = @password
  end
end
