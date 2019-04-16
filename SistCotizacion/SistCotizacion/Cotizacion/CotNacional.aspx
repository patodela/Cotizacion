<%@ Page Title="" Language="C#" MasterPageFile="~/NavContenido.Master" AutoEventWireup="true" CodeBehind="CotNacional.aspx.cs" Inherits="SistCotizacion.Cotizacion.CotNacional" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolderNavContenido" runat="server">
<div class="panel panel-default">
            <div class="panel-heading text-center"><strong>COTIZACION</strong></div>
            <div class="panel-body">
                
                     <table class="table table-bordered" id="titulo">
                         <%--<thead >--%>
                             <tr >
                                  <td colspan="2">Titulo</td>
                                 <td rowspan="3" width="50%" >LOGO EMPRESA AQUI</td>
                             </tr>                            
                       <%--  </thead>--%>
                         <%--<tbody class="text-center">--%>
                             <tr>
                                 <td  colspan="2"><strong>Bajada Titulo</strong></td>
                                                                                                   
                             </tr>  
                             <tr>
                                 <td  colspan="2" ><strong>Subtitulo</strong></td> 
                                                               
                             </tr>                            
                         <%--</tbody>--%>
                     </table>
                     <table class="table table-bordered" id="tablaCabeceraCotizacion">
                         <thead >
                             <tr>
                                 <th>0</th>
                                 <th colspan="11" class="text-center">Informacion de Documento</th>
                             </tr>                                                           
                         </thead>
                         <tbody class="text-center">
                             <tr >
                                  <th colspan="6" class="text-center">Cotizacion</th>
                                 <th colspan ="6" class="text-center">Orden</th>
                             </tr>  
                             <tr>                                 
                                 <td colspan="2">COTIZACIÓN Nº</td >
                                 <td colspan="2">
                                     <asp:Label ID="lblNumberCot" runat="server"></asp:Label></td >
                                 <td >Act.</td >
                                 <td ><asp:Label ID="lblAct" runat="server"></asp:Label></td >
                                 <td colspan="2">Autorizacion Nº</td >
                                 <td colspan="2"></td >
                                 <td >Act.</td >
                                 <td >8</td >
                             </tr> 
                             <tr>                                 
                                 <td colspan="2">Emision/Aprobacions</td >
                                 <td colspan="2">
                                     <asp:Label ID="Label1" runat="server"></asp:Label></td >
                                 <td colspan="2">Act.</td >                                 
                                 <td colspan="2">Emision/Autorizacion</td >
                                 <td colspan="2">&nbsp;</td >
                                 <td colspan="2">Act.</td >                                
                             </tr>        
                             <tr>
                                 <td colspan="2">Validad Hasta</td >                                 
                                 <td colspan="4"></td >
                                 <td colspan="2">Validad Hasta</td >
                                 <td colspan="4"></td > 
                             </tr>  
                             <tr>
                                 <td colspan="2">Estado</td >                                 
                                 <td colspan="4"></td >
                                 <td colspan="2">Estado</td >
                                 <td colspan="4"></td > 
                             </tr> 
                             <tr>
                                 <td colspan="6">Documentos Adjuntos</td>
                                 <td colspan="6">Divisas</td>
                             </tr>              
                             <tr>
                                 <td colspan="2">Catalogo Nº</td >                                 
                                 <td colspan="4"></td >
                                 <td colspan="2">CLP</td >
                                 <td colspan="4"></td > 
                             </tr>       
                              <tr>                                 
                                 <td colspan="2">Hoja de Aforo/Instrucciones Nº</td >
                                 <td colspan="2"></td >
                                 <td colspan="2"></td >                                 
                                 <td colspan="2">USD ; T/C</td >
                                 <td colspan="4"></td >                                                               
                             </tr> 
                             <tr>                                 
                                 <td colspan="2">Seguimientos OP/FN Nº</td >
                                 <td colspan="2"></td >
                                 <td colspan="2"></td >                                 
                                 <td colspan="2">UF ; T/C</td >
                                 <td colspan="4"></td >                                                               
                             </tr>                      
                         </tbody>
                     </table>
                <asp:Button ID="Button1" runat="server" Text="Button" OnClick="Button1_Click" />
                <asp:Table ID="Table1" runat="server" class="table table-bordered" >
                     <%-- <asp:TableHeaderRow>
                        
                            <asp:TableRow>
                                <th colspan="9" class="text-center">Listado de Mercancias</th>
                            </asp:TableRow>
                                <tr>
                                 <th>Nº</th>
                                 <th>Imagen</th>
                                 <th>Codigo SKU</th>
                                 <th>Descripcion</th>
                                 <th>Detalle</th>
                                 <th>Costo Unitario</th>
                                 <th>Cantidad</th>
                                 <th>UM</th>
                                 <th>Costo Total</th>                           
                            </tr>
                        </asp:TableHeaderRow>--%>
                    
                                                                                  
                            <%-- <asp:TableRow ID="fila1" runat="server">
                               <asp:TableCell rowspan="5">Nº</asp:TableCell>
                                 <asp:TableCell rowspan="5">Imagen</asp:TableCell>
                                 <asp:TableCell rowspan="2">Codigo SKU</asp:TableCell>                                 
                                 <asp:TableCell rowspan ="5">Descripcion</asp:TableCell>
                                 <asp:TableCell>Detalle</asp:TableCell>
                                 <asp:TableCell>Costo Unitario</asp:TableCell>
                                 <asp:TableCell rowspan ="5" ColumnSpan ="2">Cantidad</asp:TableCell>                                 
                                 <asp:TableCell>Costo Total</asp:TableCell>
                             </asp:TableRow>
                             <asp:TableRow ID="fila2" runat="server">
                                 <asp:TableCell rowspan="2">Detalle</asp:TableCell>
                                 <asp:TableCell rowspan="2">Costo Unitario</asp:TableCell>
                                 <asp:TableCell rowspan="2">Costo Total</asp:TableCell>
                             </asp:TableRow>
                             <asp:TableRow ID="fila3" runat="server"> 
                                 <asp:TableCell rowspan="3">provedor</asp:TableCell>
                             </asp:TableRow>
                             <asp:TableRow ID="fila4" runat="server">
                                 <asp:TableCell rowspan="2">Detalle</asp:TableCell>
                                 <asp:TableCell rowspan="2">Costo Unitario</asp:TableCell>
                                 <asp:TableCell rowspan="2">Costo Total</asp:TableCell>
                             </asp:TableRow>          --%>        

                      </asp:Table>
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

</asp:Content>
