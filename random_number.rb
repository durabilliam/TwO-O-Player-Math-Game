class RandomNumber
  attr_accessor :number

  def initialize
    @number = rand(1..20)
  end

end 