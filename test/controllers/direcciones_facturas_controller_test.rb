require 'test_helper'

class DireccionesFacturasControllerTest < ActionDispatch::IntegrationTest
  setup do
    @direcciones_factura = direcciones_facturas(:one)
  end

  test "should get index" do
    get direcciones_facturas_url
    assert_response :success
  end

  test "should get new" do
    get new_direcciones_factura_url
    assert_response :success
  end

  test "should create direcciones_factura" do
    assert_difference('DireccionesFactura.count') do
      post direcciones_facturas_url, params: { direcciones_factura: { colonia: @direcciones_factura.colonia, cp: @direcciones_factura.cp, estado: @direcciones_factura.estado, municipio: @direcciones_factura.municipio, notas: @direcciones_factura.notas, numero: @direcciones_factura.numero, rfc: @direcciones_factura.rfc, user_id: @direcciones_factura.user_id } }
    end

    assert_redirected_to direcciones_factura_url(DireccionesFactura.last)
  end

  test "should show direcciones_factura" do
    get direcciones_factura_url(@direcciones_factura)
    assert_response :success
  end

  test "should get edit" do
    get edit_direcciones_factura_url(@direcciones_factura)
    assert_response :success
  end

  test "should update direcciones_factura" do
    patch direcciones_factura_url(@direcciones_factura), params: { direcciones_factura: { colonia: @direcciones_factura.colonia, cp: @direcciones_factura.cp, estado: @direcciones_factura.estado, municipio: @direcciones_factura.municipio, notas: @direcciones_factura.notas, numero: @direcciones_factura.numero, rfc: @direcciones_factura.rfc, user_id: @direcciones_factura.user_id } }
    assert_redirected_to direcciones_factura_url(@direcciones_factura)
  end

  test "should destroy direcciones_factura" do
    assert_difference('DireccionesFactura.count', -1) do
      delete direcciones_factura_url(@direcciones_factura)
    end

    assert_redirected_to direcciones_facturas_url
  end
end
