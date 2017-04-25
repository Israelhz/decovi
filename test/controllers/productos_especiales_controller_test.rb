require 'test_helper'

class ProductosEspecialesControllerTest < ActionDispatch::IntegrationTest
  setup do
    @productos_especiale = productos_especiales(:one)
  end

  test "should get index" do
    get productos_especiales_url
    assert_response :success
  end

  test "should get new" do
    get new_productos_especiale_url
    assert_response :success
  end

  test "should create productos_especiale" do
    assert_difference('ProductosEspeciale.count') do
      post productos_especiales_url, params: { productos_especiale: { acabado: @productos_especiale.acabado, aprobado: @productos_especiale.aprobado, nombre: @productos_especiale.nombre, user_id: @productos_especiale.user_id } }
    end

    assert_redirected_to productos_especiale_url(ProductosEspeciale.last)
  end

  test "should show productos_especiale" do
    get productos_especiale_url(@productos_especiale)
    assert_response :success
  end

  test "should get edit" do
    get edit_productos_especiale_url(@productos_especiale)
    assert_response :success
  end

  test "should update productos_especiale" do
    patch productos_especiale_url(@productos_especiale), params: { productos_especiale: { acabado: @productos_especiale.acabado, aprobado: @productos_especiale.aprobado, nombre: @productos_especiale.nombre, user_id: @productos_especiale.user_id } }
    assert_redirected_to productos_especiale_url(@productos_especiale)
  end

  test "should destroy productos_especiale" do
    assert_difference('ProductosEspeciale.count', -1) do
      delete productos_especiale_url(@productos_especiale)
    end

    assert_redirected_to productos_especiales_url
  end
end
