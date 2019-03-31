require 'rspec'
require_relative '../src/age'

describe 'age of empires tests' do
  #Los guerreros tienen estos parámetros por default: potencial_ofensivo=20, energia=100, potencial_defensivo=10
  it 'vikingo ataca a atila' do
    atila= Guerrero.new
    vikingo = Guerrero.new 70

    vikingo.atacar atila
    expect(atila.energia).to eq(40)
  end

  it 'espadachin ataca a atila' do
    atila= Guerrero.new
    don_quijote = Espadachin.new(Espada.new(50))

    don_quijote.atacar atila
    expect(atila.energia).to eq(40)
  end

  it 'atila ataca a vikingo pero no le hace danio' do
    atila= Guerrero.new
    vikingo = Guerrero.new 20, 100, 70

    atila.atacar vikingo
    expect(vikingo.energia).to eq(100)
  end

  it 'Muralla solo defiende' do
    muralla = Muralla.new
    vikingo = Guerrero.new 70

    vikingo.atacar(muralla)
    expect(muralla.energia).to eq(180)
    vikingo.atacar(muralla)
    expect(muralla.energia).to eq(160)
  end

  it 'Muralla no ataca' do
    muralla = Muralla.new
    don_quijote = Espadachin.new(Espada.new(40))
    #Esto es la manera sintáctica de decir que lo que se espera dentro de los {} del expect, lanza una exception.
    #Despues veremos que quieren decir los {}
    expect { muralla.atacar don_quijote }.to raise_error(NoMethodError)
  end

  it 'Misil no defiende' do
    misil = Misil.new
    don_quijote = Espadachin.new(Espada.new(40))
    expect { don_quijote.atacar misil }.to raise_error(NoMethodError)
  end

  it 'si un defensor descansa, su energia aumenta en 10 unidades' do
    ragnar = Guerrero.new
    ragnar.descansar
    expect(ragnar.energia).to eq 110
  end

  it 'si un atacante descansa, su proximo ataque es el doble de potente' do
    ragnar = Guerrero.new
    ragnar.descansar

    atila = Guerrero.new
    ragnar.atacar(atila)
    expect(atila.energia).to eq 70
  end

  it 'una muralla puede descansar' do
    muralla = Muralla.new
    muralla.descansar
    expect(muralla.energia).to eq 210
  end

  it 'un kamikaze descansa como atacante' do
    kamikaze = Kamikaze.new
    kamikaze.descansar
    expect(kamikaze.descansado).to eq true
  end

  it 'un kamikaze no descansa como defensor' do
    kamikaze = Kamikaze.new
    kamikaze.descansar
    expect(kamikaze.energia).to eq 250
  end

  it 'un peloton hace descansar a sus guerreros cansados' do
    ragnar = Guerrero.new 10, 10 ,10
    peloton = Peloton.new([ragnar])

    peloton.descansar
    expect(ragnar).to receive(:descansar)
  end
end