require 'test_helper'

class ClientControllerTest < ActionDispatch::IntegrationTest

  setup do
    @user = users(:one)
    sign_in @user

    @campaign = Campaign.create(
      name: 'Olimpica'
    )

    # Create two active clients.
    @client1 = Client.create(
      first_name: 'John',
      last_name: 'Doe',
      is_active: true,
      campaign: @campaign
    )
    @client2 = Client.create(
      first_name: 'Jenny',
      last_name: 'Doe',
      is_active: true,
      campaign: @campaign
    )
    @client3 = Client.create(
      first_name: 'Jenny',
      last_name: 'Doe',
      is_active: false,
      campaign: @campaign
    )
  end

  test "active and inactive client list" do
    get "#{client_index_path}?status=active"

    # Make sure the list has the two names.
    assert_select 'a', @client1.first_name
    assert_select 'a', @client2.first_name

    get "#{client_index_path}?status=inactive"
    assert_select 'a', @client3.first_name
  end

  test "generating active clients reports" do
    get "#{client_index_path('csv')}?status=active"
    assert_response :success
    assert_equal 'text/csv', response.content_type
  end

  test "generating inactive clients reports" do
    get "#{client_index_path('csv')}?status=inactive"
    assert_response :success
    assert_equal 'text/csv', response.content_type
  end

  test "client detail" do
    get client_path(@client1)
    assert_response :success
    assert_select 'h1', @client1.full_name
  end

end
