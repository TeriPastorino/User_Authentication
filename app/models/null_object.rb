class NullObject
    def method_missing(*)
      self
  end

  def id
    false
  end

  def verify_password(*)
    false
  end
  
end
