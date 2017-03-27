require 'test_helper'

class RazonesComercialesControllerTest < ActionDispatch::IntegrationTest
  setup do
    @razones_comerciale = razones_comerciales(:one)
  end

  test "should get index" do
    get razones_comerciales_url
    assert_response :success
  end

  test "should get new" do
    get new_razones_comerciale_url
    assert_response :success
  end

  test "should create razones_comerciale" do
    assert_difference('RazonesComerciale.count') do
      post razones_comerciales_url, params: { razones_comerciale: { area: @razones_comerciale.area, nombre: @razones_comerciale.nombre, razones_sociale_id: @razones_comerciale.razones_sociale_id, telefono1: @razones_comerciale.telefono1, telefono2: @razones_comerciale.telefono2 } }
    end

    assert_redirected_to razones_comerciale_url(RazonesComerciale.last)
  end

  test "should show razones_comerciale" do
    get razones_comerciale_url(@razones_comerciale)
    assert_response :success
  end

  test "should get edit" do
    get edit_razones_comerciale_url(@razones_comerciale)
    assert_response :success
  end

  test "should update razones_comerciale" do
    patch razones_comerciale_url(@razones_comerciale), params: { razones_comerciale: { area: @razones_comerciale.area, nombre: @razones_comerciale.nombre, razones_sociale_id: @razones_comerciale.razones_sociale_id, telefono1: @razones_comerciale.telefono1, telefono2: @razones_comerciale.telefono2 } }
    assert_redirected_to razones_comerciale_url(@razones_comerciale)
  end

  test "should destroy razones_comerciale" do
    assert_difference('RazonesComerciale.count', -1) do
      delete razones_comerciale_url(@razones_comerciale)
    end

    assert_redirected_to razones_comerciales_url
  end
end
