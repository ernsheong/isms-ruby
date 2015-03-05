require 'isms/version'

module ISMS
  module Configuration
    DEFAULT_PROTOCOL = 'http'
    DEFAULT_USERNAME = nil
    DEFAULT_PASSWORD = nil

    attr_accessor :username, :password, :protocol

    # When extended, call reset to set variable values to defaults
    def self.extended(mod)
      mod.reset
    end

    def reset
      self.username = DEFAULT_USERNAME
      self.password = DEFAULT_PASSWORD
      self.protocol = DEFAULT_PROTOCOL
    end

    def configure
      yield self
    end

  end
end
