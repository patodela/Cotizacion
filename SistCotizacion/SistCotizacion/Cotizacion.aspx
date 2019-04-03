<%@ Page Title="" Language="C#" MasterPageFile="~/NavContenido.Master" AutoEventWireup="true" CodeBehind="Cotizacion.aspx.cs" Inherits="SistCotizacion.Cotizacion" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <link href="Content/cotizacion.css" rel="stylesheet" />

</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolderNavContenido" runat="server">
  
     <div class="panel panel-default">
            <div class="panel-heading text-center"><strong>COTIZACION</strong></div>
            <div class="panel-body">
                 <div class="table-responsive">
                     <table class="table table-bordered" id="tablaCabeceraCotizacion">
                         <thead >
                             <tr >
                                  <th class="alert-danger text-center" colspan="2">Cotizacion de Servicio</th>
                                 <th rowspan="6">LOGO EMPRESA AQUI</th>
                             </tr>                            
                         </thead>
                         <tbody class="text-center">
                             <tr>
                                 <td class="active" colspan="2"><strong>Servicios Generales</strong></td>
                                 
                             </tr>
                             <tr>
                                 <td><strong>Cotización S.Nº</strong></td>
                                 <td></td>
                             </tr>
                              <tr>
                                 <td><strong>Fecha de emisión</strong></td>
                                 <td></td>
                             </tr>
                              <tr>
                                 <td><strong>Válida hasta</strong></td>
                                 <td></td>
                             </tr>
                              <tr>
                                 <td><strong>ESTADO</strong></td>
                                 <td></td>
                             </tr>
                         </tbody>
                     </table>

                     <table class="table table-bordered" id="tablaSubCabeceraCotizacion">
                         <thead>
                             <tr>
                                 <th class="danger">1</th>
                                 <th class="active text-center"> Proveedor del Servicio</th>
                                 <th class="danger">2</th>
                                 <th class="active text-center">Cliente</th>
                             </tr>
                         </thead>
                         <tbody>
                             <tr>
                                 <td class="text-nowrap"><strong>Empresa :</strong></td>
                                 <td> (COD) RM IMPEX SPA</td>
                                 <td class="text-nowrap"><strong>Empresa :</strong></td>
                                 <td>(COD) Cliente</td>
                             </tr>
                             <tr>
                                 <td><strong>RUT(DNI,Tax ID) :</strong></td>
                                 <td>11111111-1</td>
                                 <td><strong>RUT(DNI,Tax ID) :</strong></td>
                                 <td>11111111-1</td>
                             </tr>
                                 <tr>
                                 <td><strong>Dirección :</strong></td>
                                 <td>País:  ; Ciudad:  ; Dirección:  ; Código Postal:  </td>
                                 <td><strong>Dirección :</strong></td>
                                 <td>País:  ; Ciudad:  ; Dirección:  ; Código Postal:  </td>
                             </tr>
                               <tr>
                                 <td><strong>Asesor Asignado a la operacion</strong></td>
                                 <td rowspan="2">dasdasdsad</td>
                                 <td><strong>Intrucciones de pago al proveedor</strong></td>
                                 <td rowspan="2"> sadasdasdas</td>
                             </tr>
                         </tbody>
                     </table>

                     <table class="table table-bordered" id="tablaDetalleCotizacion">
                         <thead>
                             <tr>
                                 <th class="danger">3</th>
                                 
                                 <th class="active text-center" colspan="9">Detalle de la Compra</th>
                             </tr>
                         </thead>
                         <tbody>
                             <tr><td></td>
                                 <td class="text-center active">
                                    <strong>Departamento</strong>
                                 </td>
                                 <td class="text-center active">
                                    <strong>Categoría</strong>
                                 </td>
                                 <td class="text-center active">
                                    <strong>Tipo</strong>
                                 </td>
                                  <td class="text-center active">
                                    <strong>Sigla</strong>
                                 </td>
                                  <td class="text-center active">
                                    <strong>Código</strong>
                                 </td>
                                  <td class="text-center active">
                                    <strong>Descripción</strong>
                                 </td>
                                 <td class="text-center active">
                                    <strong>Cantidad</strong>
                                 </td>
                                  <td class="text-center active">
                                    <strong>Total CL$</strong>
                                 </td>
                                 <td class="text-center active">
                                    <strong>Duración</strong>
                                 </td>
                             </tr>
                             <tr>
                                 <td></td>
                                 <td></td>
                                 <td></td>
                                 <td></td>
                                 <td></td>
                                 <td></td>
                                 <td></td>
                                 <td></td>
                                 <td></td>
                                 <td></td>
                             </tr>
                             <tr>
                                 <td></td>
                                 <td></td>
                                 <td></td>
                                 <td></td>
                                 <td></td>
                                 <td></td>
                                 <td></td>
                                 <td></td>
                                 <td></td>
                                 <td></td>
                             </tr>
                             <tr>
                                 <td></td>
                                 <td></td>
                                 <td></td>
                                 <td></td>
                                 <td></td>
                                 <td></td>
                                 <td></td>
                                 <td></td>
                                 <td></td>
                                 <td></td>
                             </tr>
                             <tr>
                                 <td></td>
                                 <td></td>
                                 <td></td>
                                 <td></td>
                                 <td></td>
                                 <td></td>
                                 <td></td>
                                 <td></td>
                                 <td></td>
                                 <td></td>
                             </tr>
                             <tr>
                                 <td></td>
                                 <td></td>
                                 <td></td>
                                 <td></td>
                                 <td></td>
                                 <td></td>
                                 <td></td>
                                 <td></td>
                                 <td></td>
                                 <td></td>
                             </tr>
                             <tr>
                                 <td></td>
                                 <td></td>
                                 <td></td>
                                 <td></td>
                                 <td></td>
                                 <td></td>
                                 <td></td>
                                 <td></td>
                                 <td></td>
                                 <td></td>
                             </tr>
                             <tr>
                                 <td></td>
                                 <td></td>
                                 <td></td>
                                 <td></td>
                                 <td></td>
                                 <td></td>
                                 <td></td>
                                 <td></td>
                                 <td></td>
                                 <td></td>
                             </tr>
                             <tr>
                                 <td></td>
                                 <td></td>
                                 <td></td>
                                 <td></td>
                                 <td></td>
                                 <td></td>
                                 <td></td>
                                 <td></td>
                                 <td></td>
                                 <td></td>
                             </tr>
                             <tr>
                                 <td></td>
                                 <td></td>
                                 <td></td>
                                 <td></td>
                                 <td></td>
                                 <td></td>
                                 <td></td>
                                 <td></td>
                                 <td></td>
                                 <td></td>
                             </tr>
                             
                         </tbody>
                         <tfoot>
                            <tr>
                                <td class="active text-center h3" colspan="8" rowspan="3"><strong>Totales</strong> </td>
                                <td class="active text-center"><strong>NETO</strong></td> 
                                <td class="active"><strong>$</strong></td>                               
                            </tr>
                             <tr><td class="active text-center"><strong>IVA</strong></td> 
                                <td class="active"><strong>$</strong></td>                 </tr>
                             <tr><td class="active text-center"><strong>BRUTO</strong></td> 
                                <td class="active"><strong>$</strong></td>                 </tr>
                         </tfoot>
                     </table>

                     <table class="table table-bordered">
                         <thead>
                             <tr>
                                 <th class="danger">
                                     4
                                 </th>
                                 <th class="text-center active" colspan="4">Condiciones del Servicio</th>
                             </tr>
                         </thead>
                         <tbody>
                             <tr>
                                 <td class="active text-center" colspan="5"><strong>Operación</strong></td>
                             </tr>
                             <tr>
                                 <td class="text-center"><strong>Departamento</strong></td>
                                 <td colspan="4">
                                     <asp:TextBox CssClass="form-control" ID="txtDpto" runat="server"></asp:TextBox>

                                 </td>
                             </tr>
                             <tr>
                                 <td class="text-center"><strong>Asesor Asignado</strong></td>
                                 <td colspan="4">
                                     <asp:TextBox CssClass="form-control" ID="txtAsesor" runat="server"></asp:TextBox>

                                 </td>
                             </tr>
                               <tr>
                                 <td class="active text-center" colspan="5"><strong>Cliente</strong></td>
                             </tr>
                             <tr class="text-center">
                                 <td class="active" rowspan="2"><strong>Pago</strong></td>
                                 <td class="text-center"><strong>MEDIO</strong></td>
                                 <td>
                                     <asp:TextBox CssClass="form-control" ID="txtMedioPago" runat="server"></asp:TextBox></td>
                                 <td class="text-center"><strong>FORMA</strong></td>
                                 <td><asp:TextBox CssClass="form-control" ID="txtFormaPago" runat="server"></asp:TextBox></td>
                             </tr>
                             <tr>
                                 <td class="text-center"> <strong>Fecha(s) de pago</strong></td>
                                 <td colspan="3"><asp:TextBox CssClass="form-control" ID="txtFechasPago" runat="server"></asp:TextBox></td>
                             </tr>
                             <tr class="text-center">
                                 <td rowspan="2" class="active"><strong>Garantía</strong></td>
                                 <td><strong>Retrasos</strong></td>
                               <td colspan="3"><asp:TextBox CssClass="form-control" ID="txtRetrasos" runat="server"></asp:TextBox></td>
                             </tr>
                             <tr class="text-center">
                                 <td><strong>No pago</strong></td>
                                 <td colspan="3"><asp:TextBox CssClass="form-control" ID="txtNoPago" runat="server"></asp:TextBox></td>
                             </tr>
                             <tr>
                                 <td class="active text-center"><strong>Comentario(s)</strong></td>
                                 <td colspan="4"><asp:TextBox CssClass="form-control" ID="txtComentarios" runat="server" TextMode="MultiLine" Rows="2"></asp:TextBox></td>
                             </tr>
                             <tr>
                                 <td class="active text-center" colspan="5"><strong>Proveedor del servicio</strong></td>
                             </tr>
                             <tr><td class="active" rowspan="5"><strong>Facturación</strong></td></tr>
                             <tr>
                                 <td><strong>Tipo de documento(s)</strong></td>
                                 <td colspan="3">
                                     <asp:TextBox CssClass="form-control" ID="txtTipoDocumento" runat="server"></asp:TextBox></td>
                             </tr>
                             <tr>
                                 <td><strong>Condiciones</strong></td>
                                 <td colspan="3"><asp:TextBox CssClass="form-control" ID="txtCondiciones" runat="server"></asp:TextBox></td>
                             </tr>
                             <tr>
                                 <td><strong>Plazo de emisión</strong></td>
                                 <td><asp:TextBox CssClass="form-control" ID="txtFechaEmision1" runat="server" TextMode="Date"></asp:TextBox></td>
                                 <td><asp:TextBox CssClass="form-control" ID="txtFechaEmision2" runat="server" TextMode="Date"></asp:TextBox></td>
                             </tr>
                             <tr>
                                 <td><strong>Monto(s) neto</strong></td>
                                 <td colspan="3"><asp:TextBox CssClass="form-control" ID="txtMontoNeto" runat="server" TextMode="Date"></asp:TextBox></td>
                             </tr>
                         </tbody>
                     </table>

                     <table class="table table-bordered">
                         <thead>
                             <tr class="danger">
                                 <th class="text-center">EMITE (CARGO - DEPARTAMENTO / ÁREA)</th>
                                 <th class="text-center">APRUEBA</th>
                             </tr>
                         </thead>
                         <tbody>
                             <tr class="active">
                                 <td class="text-center" style="width:50%;"><small>"Yo solicité la emisión de esta orden y soy el encargado de su negociación"</small></td>
                                 <td></td>
                             </tr>
                             <tr><td></td><td></td></tr>
                         </tbody>
                     </table>
                     </div>
                </div>
          </div>
  
</asp:Content>
