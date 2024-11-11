# lib/user.rb
require_relative 'api_client'

class User
  attr_reader :id, :name, :job, :first_name, :last_name, :email, :avatar

  # Constructor para crear un usuario con 'name' y 'job'. Los demás atributos se asignan posteriormente.
  def initialize(name, job, id = nil, first_name = nil, last_name = nil, email = nil, avatar = nil)
    @id = id
    @name = name
    @job = job
    @first_name = first_name
    @last_name = last_name
    @email = email
    @avatar = avatar
  end

  # Crear un usuario con 'name' y 'job'
  def self.create(name, job)
    # Enviamos la solicitud POST para crear el usuario
    user_data = ApiClient.post('https://reqres.in/api/users', { name: name, job: job })
    puts user_data[:code]
    if user_data[:code] != 201
      raise "Failed to create user. HTTP Status: #{user_data[:code]}"
    end
    body = user_data[:body]  # Obtenemos el cuerpo de la respuesta

    # Creamos la instancia de User con el 'id' recibido
    # Los detalles completos serán obtenidos después con fetch_details
    new(name, job, body['id'])
  end

  # Obtener detalles completos del usuario con el 'id'
  def fetch_details
    raise 'User ID is nil' if @id.nil?
    puts @id

    # Realizamos el GET a la URL correcta para obtener los detalles del usuario
    user_data = ApiClient.get("https://reqres.in/api/users/#{@id}")
    body = user_data[:body]
    data = body['data']

    # Actualizamos los detalles del usuario con los datos obtenidos
    @first_name = data['first_name']
    @last_name = data['last_name']
    @email = data['email']
    @avatar = data['avatar']
    self  # Devolvemos la instancia de User actualizada
  end
end
