class Account < ActiveRecord::Base
  include BCrypt

  def forget_me
    update_attributes(:remember_expiry => nil, :remember_token => nil) unless new_record?
  end

  def password
    if hashed_password
      @password ||= Password.new(hashed_password)
    end
  end

  def password=(new_password)
    @password = Password.create(new_password)
    self.hashed_password = @password
  end

  def remember_me
    update_attributes(:remember_expiry => 2.weeks.from_now, :remember_token => Password.create("#{remember_salt}-#{self.uname}")) unless new_record?
  end

  def self.authenticate(uname, password)
    if user = Account.find_by_uname(uname)
      user = nil if user.password != password
    end
    user
  end

  private

    def remember_salt
      Time.now
    end
end
