def suma_par(lista, objetivo)
  vistos = {}

  lista.each do |num|
    diferencia = objetivo - num

    #Mostrar la diferencia calculada
    puts "Número actual: #{num}, Diferencia: #{diferencia}, Vistos: #{vistos.inspect}"

    if vistos[diferencia]
      puts "¡Par encontrado! #{diferencia} y #{num} suman #{objetivo}"
      return [diferencia, num]
    end

    vistos[num] = true
  end

  return nil
end

# Ejemplo de uso:
puts suma_par([1, 2, 3, 4, 10], 9).inspect
