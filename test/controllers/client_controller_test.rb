require 'test_helper'

class ClientControllerTest < ActionDispatch::IntegrationTest

  setup do
    @user = users(:one)
    sign_in @user

    # Create two active clients.
    Client.objects.create(
      first_name: 'John',
      last_name: 'Doe',
      is_active: true
    )

    Client.objects.create(
      first_name: 'Jenny',
      last_name: 'Doe',
      is_active: true
    )
  end

  test "client list" do
    get client_index_path
    assert_container

  end

end
