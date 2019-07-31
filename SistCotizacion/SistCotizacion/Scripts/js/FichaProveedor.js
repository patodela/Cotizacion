$(document).ready(function () {

    var value = $('input[id$=hdTipoProveedor]').val();
    value = parseInt(value);
    if (value === 1) {
        ControlByType("#Pnatural");
        $("#Pnatural").prop("checked", true);
        $("#Pjuridica").prop("checked", false);
    }else{
        ControlByType("#Pjuridica");
        $("#Pnatural").prop("checked", false);
        $("#Pjuridica").prop("checked", true);
    }
    
    

    $("#Pnatural").click(function () {

        if ($(this).prop("checked", true)) {
            ControlByType(this);
        }
    });
    $("#Pjuridica").click(function () {
        if ($(this).prop("checked", true)) {
            ControlByType(this);
        }
    });

    
    $("a[id$=btnAceptarMensaje]").click(function () {
         window.location.replace("Proveedor.aspx");
    });

    var CodeProv = getUrlParameter('CodPro');
    if (CodeProv != undefined) {
        $("#Pjuridica").attr("disabled", "disabled");
        $("#Pnatural").attr("disabled", "disabled");
        $("#divNatural").attr("disabled", "disabled");
        $("#divJuridico").attr("disabled", "disabled");
    }
    var tipo = getUrlParameter('Tipo');
    if (tipo != undefined) {
        if (tipo == "Natural") {
            $("#Pnatural").prop("checked", true);
            $("#Pjuridica").prop("checked", false);
        } else {
            $("#Pnatural").prop("checked", false);
            $("#Pjuridica").prop("checked", true);
        }
    }

});


/*
    Function add and remove attribute required by controll type
    author : Patricio Imilqueo
    date   : 11-07-2019
*/
function ControlByType(controll) {
    var type = parseInt($(controll).val());
    if (type === 1) { //Natural
        $("#Tipo").text("NATURAL");
        $("#TablaProveedorNatural").show();
        $("#TablaProveedorJuridico").hide();
        $('input[id$=hdTipoProveedor]').attr('value', $(controll).val());
        $("input[id$=TxtRepreNombre]").removeAttr('required');
        $("input[id$=TxtRepreRutID]").removeAttr('required');
        $("input[id$=TxtRepreTelefono]").removeAttr('required');
        $("input[id$=TxtInfCompIDRUT]").removeAttr('required');
        $("input[id$=TxtInfCompRazonSocial]").removeAttr('required');
        $("input[id$=TxtInfCompTelefono]").removeAttr('required');
        $("input[id$=TxtFactPais]").removeAttr('required');
        $("input[id$=TxtFactEstadoRegion]").removeAttr('required');
        $("input[id$=TxtFactCiudad]").removeAttr('required');
        $("input[id$=TxtFactCodPostal]").removeAttr('required');
        $("input[id$=TxtFactDir]").removeAttr('required');
        $("input[id$=TxtFactGiroActividad]").removeAttr('required');
        $("input[id$=txtCtaFactNombre]").removeAttr('required');
        $("input[id$=txtCtaFactRUTID]").removeAttr('required');
        $("input[id$=txtCtaFactBanco]").removeAttr('required');
        $("input[id$=txtCtaFactTipoCuenta]").removeAttr('required');
        $("input[id$=txtCtaFactNumCta]").removeAttr('required'); 
        $("input[id$=txtNatNombre]").attr('required', 'required');
        $("input[id$=txtNatRut]").attr('required', 'required');
        $("input[id$=txtNatFono]").attr('required', 'required');


    } else {//Juridica
        $("#Tipo").text("JURIDICO");

        $("#TablaProveedorNatural").hide();
        $("#TablaProveedorJuridico").show();
        $('input[id$=hdTipoProveedor]').attr('value', $(controll).val());       
        $("input[id$=TxtRepreNombre]").attr('required', 'required'); 
        $("input[id$=TxtRepreRutID]").attr('required', 'required'); 
        $("input[id$=TxtRepreTelefono]").attr('required', 'required'); 
        $("input[id$=TxtInfCompIDRUT]").attr('required', 'required');
        $("input[id$=TxtInfCompRazonSocial]").attr('required', 'required');
        $("input[id$=TxtInfCompTelefono]").attr('required', 'required');
        $("input[id$=TxtFactPais]").attr('required', 'required'); 
        $("input[id$=TxtFactEstadoRegion]").attr('required', 'required');
        $("input[id$=TxtFactCiudad]").attr('required', 'required');
        $("input[id$=TxtFactCodPostal]").attr('required', 'required');
        $("input[id$=TxtFactDir]").attr('required', 'required');
        $("input[id$=TxtFactGiroActividad]").attr('required', 'required');
        $("input[id$=txtCtaFactNombre]").attr('required', 'required');
        $("input[id$=txtCtaFactRUTID]").attr('required', 'required');
        $("input[id$=txtCtaFactBanco]").attr('required', 'required');
        $("input[id$=txtCtaFactTipoCuenta]").attr('required', 'required');
        $("input[id$=txtCtaFactNumCta]").attr('required', 'required');
        $("input[id$=txtNatNombre]").removeAttr('required');
        $("input[id$=txtNatRut]").removeAttr('required');
        $("input[id$=txtNatFono]").removeAttr('required');
    }

}


var getUrlParameter = function getUrlParameter(sParam) {
    var sPageURL = window.location.search.substring(1),
        sURLVariables = sPageURL.split('&'),
        sParameterName,
        i;

    for (i = 0; i < sURLVariables.length; i++) {
        sParameterName = sURLVariables[i].split('=');

        if (sParameterName[0] === sParam) {
            return sParameterName[1] === undefined ? true : decodeURIComponent(sParameterName[1]);
        }
    }
};