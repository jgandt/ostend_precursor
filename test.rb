require './objectify_from_hash'

def String.random_alphanumeric(size=16)
  s = ""
  size.times { s << (i = Kernel.rand(62); i += ((i < 10) ? 48 : ((i < 36) ? 55 : 61 ))).chr }
  s
end

class Test
  include ObjectifyFromHash

  def initialize
    temp_hash = create_random_hash

    start_time = Time.now
    objectify temp_hash
    end_time = Time.now

    puts "Start: #{start_time.strftime('%M %12N')}"
    puts "End: #{end_time.strftime('%M %12N')}"
    puts "Runtime: #{(end_time - start_time)}"
  end

  def create_random_hash
    temp_hash = {}
    10000.times do |i|
      temp_hash["hash_key_#{i}"] = String.random_alphanumeric(255)
    end
    temp_hash
  end

end

Test.new
