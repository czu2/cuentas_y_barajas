class Usuario
    attr_reader :cuentas
    
    def initialize(nombre, *cuenta_bancaria)
        @nombre = nombre
        @cuenta_bancaria = cuenta_bancaria
    end

    def saldo_total
        saldo_t = @cuenta_bancaria.map{|cuenta| cuenta.saldo}.sum
    end
    
end

class CuentaBancaria
    attr_accessor :saldo, :banco

    def initialize(banco, cuenta, saldo = 0)
        @banco = banco
        @cuenta = cuenta
        @saldo = saldo
    end

    def transferir(monto, cuenta_destino, cuenta_origen)
        @saldo = @saldo - monto
        cuenta_destino.saldo = cuenta_destino.saldo + monto
    end
end

cuenta1 = CuentaBancaria.new('Santander', "123-4567", 10000)
cuenta2 = CuentaBancaria.new('B.deChile', "456-6789", 8000)

cliente = Usuario.new("Cristian", cuenta1, cuenta2)

puts "\n"
puts "El saldo de la Cuenta #{cuenta1.banco} es     $#{cuenta1.saldo}"
puts "El saldo de la Cuenta #{cuenta2.banco} es      $#{cuenta2.saldo}"
puts "El saldo total es                      $#{cliente.saldo_total}\n\n"


puts "Transferencia de $5000 desde #{cuenta1.banco} a #{cuenta2.banco}\n\n"
cuenta1.transferir(5000, cuenta2, cuenta1)

puts "El saldo de la Cuenta #{cuenta1.banco} es      $#{cuenta1.saldo}"
puts "El saldo de la Cuenta #{cuenta2.banco} es     $#{cuenta2.saldo}"
puts "El saldo total es                      $#{cliente.saldo_total}\n\n"
