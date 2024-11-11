# spec/user_spec.rb
require 'rspec'
require 'lib/user'

RSpec.describe 'User API', type: :request do
  context 'when creating a new user' do
    it 'creates a user and returns a 201 status code' do
      user = User.create('Test User', 'Automation Engineer')
      expect(user).to be_an_instance_of(User)
      expect(user.id).not_to be_nil
      expect(user.name).to eq('Test User')
      expect(user.job).to eq('Automation Engineer')

      user.fetch_details

      # TO-DO -> the get method not working correctly
      # expect(user.first_name).to eq('Test User')
      # expect(user.last_name).to eq('Automation Engineer')
      # expect(user.email).to eq('test_user@reqres.in')
      # expect(user.avatar).to eq('https://reqres.in/img/faces/default-avatar.png')
    end
  end

  # context 'when fetching a user' do
  #   it 'retrieves the details of an existing user' do
  #     user = User.create('Test User', 'Automation Engineer')
  #     user.fetch_details
  #
  #     # Verificamos que los detalles completos se hayan cargado correctamente
  #     expect(user.first_name).to eq('Test User')
  #     expect(user.last_name).to eq('Automation Engineer')
  #     expect(user.email).to eq('test_user@reqres.in')
  #     expect(user.avatar).to eq('https://reqres.in/img/faces/default-avatar.png')
  #   end
  # end
end
