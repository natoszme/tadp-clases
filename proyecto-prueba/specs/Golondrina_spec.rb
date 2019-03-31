require 'rspec'
require_relative '../src/Golondrina'

describe 'Golondrina' do

  let(:una_golondrina){
    Golondrina.new
  }

  it 'deberia perder energia cuando vuela' do
    una_golondrina.volar(1)
    expect(una_golondrina.energia).to eq(90)
  end

  it 'deberia ganar energia cuando come' do
    una_golondrina.comer(1)
    expect(una_golondrina.energia).to eq 105
  end
end