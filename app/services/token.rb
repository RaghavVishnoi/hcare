class Token
  def self.generate
    SecureRandom.hex(20).encode("UTF-8")
  end
end