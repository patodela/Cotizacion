<%@ Page Title="" Language="C#" MasterPageFile="~/NavContenido.Master" AutoEventWireup="true" CodeBehind="Cotizacion.aspx.cs" Inherits="SistCotizacion.Cotizacion" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <link href="Content/cotizacion.css" rel="stylesheet" />

</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolderNavContenido" runat="server">
    <form runat="server">
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
                     </div>
                </div>
          </div>
    </form> 
</asp:Content>
