module ISMS
  class Client
    def initialize
      # Check for username and password
      raise RuntimeError, "Username and password not provided!" unless ISMS.username && ISMS.password
    end
  end
end