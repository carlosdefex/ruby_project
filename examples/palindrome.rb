def es_palindromo(cadena)
  # Limpiar la cadena: eliminar espacios y convertir a minúsculas
  cadena_limpia = cadena.gsub(/\s+/, "").downcase

  # Comparar la cadena con su reverso
  if cadena_limpia == cadena_limpia.reverse
    return "Verdadero"
  else
    return "Falso"
  end
end

# Ejemplos de uso
puts es_palindromo("radar")       # Output: "Verdadero"
puts es_palindromo("hola")        # Output: "Falso"
puts es_palindromo("Anita lava la tina")  # Output: "Verdadero"
puts es_palindromo("A man a plan a canal Panama")  # Output: "Verdadero"
puts es_palindromo("Anilina")  # Output: "Verdadero"

