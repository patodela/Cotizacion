


$(document).ready(function () {

 
            
    $("#btnAddICar1").click(function () {
        $("#displaySearchIcar1").hide();
        $("#displayAddIcar1").show();
    });
    
    $("#btnSearchIcar1").click(function () {
        $("#displayAddIcar1").hide();
        $("#displaySearchIcar1").show();
    });

    $("#btnAddICar2").click(function () {
        $("#displaySearchIcar2").hide();
        $("#displayAddIcar2").show();
    });

    $("#btnSearchIcar2").click(function () {
        $("#displayAddIcar2").hide();
        $("#displaySearchIcar2").show();
    });

    $("#btnAddICar3").click(function () {
        $("#displaySearchIcar3").hide();
        $("#displayAddIcar3").show();
    });

    $("#btnSearchIcar3").click(function () {
        $("#displayAddIcar3").hide();
        $("#displaySearchIcar3").show();
    });

    $("#btnAddICar4").click(function () {
        $("#displaySearchIcar4").hide();
        $("#displayAddIcar4").show();
    });

    $("#btnSearchIcar4").click(function () {
        $("#displayAddIcar4").hide();
        $("#displaySearchIcar4").show();
    });

    $("#btnAddCombi").click(function () {
        $("#displaySearchCombi").hide();
        $("#displayAddcombi").show();
    });

    $("#btnSearchCombi").click(function () {
        $("#displayAddcombi").hide();
        $("#displaySearchCombi").show();
    });

    $("#btnAddMaterial").click(function () {
        $("#displaySearchMaterial").hide();
        $("#displayAddMaterial").show();
    });

    $("#btnSearchMaterial").click(function () {
        $("#displayAddMaterial").hide();
        $("#displaySearchMaterial").show();
    });

    $("#btnAddCarac2").click(function () {
        $("#displaySearchCarac2").hide();
        $("#displayAddCarac2").show();
    });

    $("#btnSearchCarac2").click(function () {
        $("#displayAddCarac2").hide();
        $("#displaySearchCarac2").show();
    });

    $("#btnAddCarac3").click(function () {
        $("#displaySearchCarac3").hide();
        $("#displayAddCarac3").show();
    });

    $("#btnSearchCarac3").click(function () {
        $("#displayAddCarac3").hide();
        $("#displaySearchCarac3").show();
    });

    //SearchInGrid("GridIcar1", "lblDescripcionICar1", "TextSearchIcar1");
   

    var tabName = $("[id*=TabName]").val() != "" ? $("[id*=TabName]").val() : "1";
    $('#TabPanel a[href="#' + tabName + '"]').tab('show');
    $("#TabPanel a").click(function () {
        $("[id*=TabName]").val($(this).attr("href").replace("#", ""));
    });

    //SetScrollPosition();


});

var prm = Sys.WebForms.PageRequestManager.getInstance();

prm.add_endRequest(function () {
    // re-bind your jQuery events here
    $("#btnAddICar1").click(function () {
        $("#displaySearchIcar1").hide();
        $("#displayAddIcar1").show();
    });

    $("#btnSearchIcar1").click(function () {
        $("#displayAddIcar1").hide();
        $("#displaySearchIcar1").show();
    });

    $("#btnAddICar2").click(function () {
        $("#displaySearchIcar2").hide();
        $("#displayAddIcar2").show();
    });

    $("#btnSearchIcar2").click(function () {
        $("#displayAddIcar2").hide();
        $("#displaySearchIcar2").show();
    });
    $("#btnAddICar3").click(function () {
        $("#displaySearchIcar3").hide();
        $("#displayAddIcar3").show();
    });

    $("#btnSearchIcar3").click(function () {
        $("#displayAddIcar3").hide();
        $("#displaySearchIcar3").show();
    });

    $("#btnAddICar4").click(function () {
        $("#displaySearchIcar4").hide();
        $("#displayAddIcar4").show();
    });

    $("#btnSearchIcar4").click(function () {
        $("#displayAddIcar4").hide();
        $("#displaySearchIcar4").show();
    });

    $("#btnAddCombi").click(function () {
        $("#displaySearchCombi").hide();
        $("#displayAddcombi").show();
    });

    $("#btnSearchCombi").click(function () {
        $("#displayAddcombi").hide();
        $("#displaySearchCombi").show();
    });

    $("#btnAddMaterial").click(function () {
        $("#displaySearchMaterial").hide();
        $("#displayAddMaterial").show();
    });

    $("#btnSearchMaterial").click(function () {
        $("#displayAddMaterial").hide();
        $("#displaySearchMaterial").show();
    });

    $("#btnAddCarac2").click(function () {
        $("#displaySearchCarac2").hide();
        $("#displayAddCarac2").show();
    });

    $("#btnSearchCarac2").click(function () {
        $("#displayAddCarac2").hide();
        $("#displaySearchCarac2").show();
    });

    $("#btnAddCarac3").click(function () {
        $("#displaySearchCarac3").hide();
        $("#displayAddCarac3").show();
    });

    $("#btnSearchCarac3").click(function () {
        $("#displayAddCarac3").hide();
        $("#displaySearchCarac3").show();
    });
});



function SearchInGrid(Grid,Label,TextSearch) {
    $("#"+TextSearch +"").keyup(function () {
        var test = $(this).val();
        $("table[id*=" + Grid + "] tr").show();
        if (test.length != 0) {
            $("table[id*=" + Grid + "] tr:has('span')").each(function () {
                if ($(this).find("span[id*=" + Label + "]:contains(" + test + ")").length == 0)
                    $(this).hide();
            });
        }
    });
}