class Golondrina
  attr_accessor :energia

  def initialize
    self.energia = 100
  end

  def volar(kms)
    self.energia -= 10 * kms
  end

  def comer(gramos)
    self.energia += 5 * gramos
  end
end