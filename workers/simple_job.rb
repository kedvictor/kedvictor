class SimpleJob
  @queue = :simple

  def self.perform(str, delay) 
    puts "Start job at #{Time.now}"   
    sleep delay   
    puts "Simple Job with '#{ str}' parameter is done (delay: #{delay} second)"
    puts "Done at #{Time.now}"   
  end
end
