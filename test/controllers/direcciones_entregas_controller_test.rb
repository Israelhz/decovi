require 'test_helper'

class DireccionesEntregasControllerTest < ActionDispatch::IntegrationTest
  setup do
    @direcciones_entrega = direcciones_entregas(:one)
  end

  test "should get index" do
    get direcciones_entregas_url
    assert_response :success
  end

  test "should get new" do
    get new_direcciones_entrega_url
    assert_response :success
  end

  test "should create direcciones_entrega" do
    assert_difference('DireccionesEntrega.count') do
      post direcciones_entregas_url, params: { direcciones_entrega: { colonia: @direcciones_entrega.colonia, cp: @direcciones_entrega.cp, estado: @direcciones_entrega.estado, municipio: @direcciones_entrega.municipio, notas: @direcciones_entrega.notas, numero: @direcciones_entrega.numero, telefono: @direcciones_entrega.telefono, user_id: @direcciones_entrega.user_id } }
    end

    assert_redirected_to direcciones_entrega_url(DireccionesEntrega.last)
  end

  test "should show direcciones_entrega" do
    get direcciones_entrega_url(@direcciones_entrega)
    assert_response :success
  end

  test "should get edit" do
    get edit_direcciones_entrega_url(@direcciones_entrega)
    assert_response :success
  end

  test "should update direcciones_entrega" do
    patch direcciones_entrega_url(@direcciones_entrega), params: { direcciones_entrega: { colonia: @direcciones_entrega.colonia, cp: @direcciones_entrega.cp, estado: @direcciones_entrega.estado, municipio: @direcciones_entrega.municipio, notas: @direcciones_entrega.notas, numero: @direcciones_entrega.numero, telefono: @direcciones_entrega.telefono, user_id: @direcciones_entrega.user_id } }
    assert_redirected_to direcciones_entrega_url(@direcciones_entrega)
  end

  test "should destroy direcciones_entrega" do
    assert_difference('DireccionesEntrega.count', -1) do
      delete direcciones_entrega_url(@direcciones_entrega)
    end

    assert_redirected_to direcciones_entregas_url
  end
end
