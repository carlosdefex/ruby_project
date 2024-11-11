def fibonacci(n)
  return [] if n <= 0

  return [0] if n == 1

  secuencia = [0, 1]
  (2...n).each do
    secuencia << secuencia[-1] + secuencia[-2]
  end

  secuencia
end

puts fibonacci(15).inspect