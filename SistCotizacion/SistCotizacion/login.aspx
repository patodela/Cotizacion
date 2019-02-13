<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="login.aspx.cs" Inherits="SistCotizacion.index" %>

<!DOCTYPE html>

<html>
<head runat="server">
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <link href="Content/bootstrap.min.css" rel="stylesheet" />
<script src="Scripts/jquery-1.9.1.min.js"></script>
<script src="Scripts/bootstrap.min.js"></script>
    


    <title>Inicio de sesión</title>
</head>
<body>
    
     <div class="container">
    <div class="row">
		<div class="col-md-4 col-md-offset-4">
    		<div class="panel panel-default">
			  	<div class="panel-heading">
			    	<h3 class="panel-title">Iniciar sesión</h3>
			 	</div>
			  	<div class="panel-body">
			    	<form accept-charset="UTF-8" role="form" runat="server">
                    <fieldset>
			    	  	<div class="form-group">
			    		    
                            <asp:TextBox ID="txt_usuario" required="required" placeholder="Usuario" runat="server" class="form-control"></asp:TextBox>

			    		</div>
			    		<div class="form-group">
			    			
                                <asp:TextBox ID="txtPassword" required="required" runat="server" placeholder="Contraseña" class="form-control" TextMode="Password"></asp:TextBox>
			    		</div>		    		
			    		
                        <asp:Button class="btn btn-lg btn-success btn-block" ID="ButtonLogin" runat="server" Text="Ingresar" OnClick="ButtonLogin_Click" />
                         <asp:Label ID="lblMensaje" runat="server" Visible="False"></asp:Label>
			    	</fieldset>
			      	</form>
			    </div>
			</div>
		</div>
	</div>
</div>
  
</body>
</html>
