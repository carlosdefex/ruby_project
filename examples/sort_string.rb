def ordenar_cadenas(cadena)
  palabras = cadena.split(" ")
  palabras_ordenadas = palabras.sort_by { |palabra| palabra.downcase }
  palabras_ordenadas.join(" ")
end

puts ordenar_cadenas("Perro gato Casa")