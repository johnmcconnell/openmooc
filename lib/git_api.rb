
class GitAPI
  def self.new
    BitBucket.new basic_auth: ENV['BITBUCKET_AUTH']
  end
end
