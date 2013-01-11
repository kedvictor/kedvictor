class SimpleJob
  @queue = :simple

  def self.perform(str)
    delay(1000)
    puts "Simple Job with '#{ str}' parameter is done"
  end
end
