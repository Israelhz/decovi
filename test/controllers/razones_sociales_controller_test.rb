require 'test_helper'

class RazonesSocialesControllerTest < ActionDispatch::IntegrationTest
  setup do
    @razones_sociale = razones_sociales(:one)
  end

  test "should get index" do
    get razones_sociales_url
    assert_response :success
  end

  test "should get new" do
    get new_razones_sociale_url
    assert_response :success
  end

  test "should create razones_sociale" do
    assert_difference('RazonesSociale.count') do
      post razones_sociales_url, params: { razones_sociale: { direccion: @razones_sociale.direccion, email: @razones_sociale.email, nombre: @razones_sociale.nombre, notas: @razones_sociale.notas, rfc: @razones_sociale.rfc, telefono: @razones_sociale.telefono, user_id: @razones_sociale.user_id } }
    end

    assert_redirected_to razones_sociale_url(RazonesSociale.last)
  end

  test "should show razones_sociale" do
    get razones_sociale_url(@razones_sociale)
    assert_response :success
  end

  test "should get edit" do
    get edit_razones_sociale_url(@razones_sociale)
    assert_response :success
  end

  test "should update razones_sociale" do
    patch razones_sociale_url(@razones_sociale), params: { razones_sociale: { direccion: @razones_sociale.direccion, email: @razones_sociale.email, nombre: @razones_sociale.nombre, notas: @razones_sociale.notas, rfc: @razones_sociale.rfc, telefono: @razones_sociale.telefono, user_id: @razones_sociale.user_id } }
    assert_redirected_to razones_sociale_url(@razones_sociale)
  end

  test "should destroy razones_sociale" do
    assert_difference('RazonesSociale.count', -1) do
      delete razones_sociale_url(@razones_sociale)
    end

    assert_redirected_to razones_sociales_url
  end
end
