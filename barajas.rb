require_relative "cartas"

class Baraja
    attr_accessor :cartas

    def initialize
        numeros = [1,2,3,4,5,6,7,8,9,10,11,12,13]
        pintas = ['C','D','P','T']
        @cartas = numeros.map{|n| pintas.map{|p| Carta.new(n,p)}}.flatten
    end

    def barajar
        @cartas.shuffle
    end

    def sacar
        @cartas.pop
    end

    def repartir
        mano = []
        5.times do
            barajar()
            mano.push(sacar)
        end
        return mano
    end
end

baraja = Baraja.new
pp baraja.repartir
