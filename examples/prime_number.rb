def es_primo?(n)
  return false if n <= 1
  return true if n == 2
  return false if n.even? # Excluir los números pares mayores que 2

  # Verificar divisibilidad hasta la raíz cuadrada de n
  limite = Math.sqrt(n).to_i
  (3..limite).step(2) do |i| #loop
    return false if n % i == 0  # Si n es divisible por i, no es primo
  end

  true  # Si no se encuentra ningún divisor, es primo
end


# Test
puts es_primo?(319087987)    # false
# puts es_primo?(2)    # true
# puts es_primo?(3)    # true
# puts es_primo?(4)    # false
# puts es_primo?(29)   # true
# puts es_primo?(100)  # false