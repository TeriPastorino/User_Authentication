require 'digest'

class User < ActiveRecord::Base

  #wrapping in own method makes for easier changes down the road if need to change sha...

  def password=(password)
    self.encrypted_password = encrypt(password)
  end

  def verify_password(password)
    encrypt(password) == encrypted_password
  end

  def encrypt(password)
    Digest::SHA256.hexdigest(password)
  end

  def to_s
    email
    #could add interpolation, split user, email to display differently
  end


end

__END__
user = User.new
user.email    =("ssss@gmail.com")
user.password = "mypassword"
    .encrypted_password
user.saveus

