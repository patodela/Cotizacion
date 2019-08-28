using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace SistCotizacion.Cotizacion
{
    public class cotizacion
    {
        private string _subTitulo;
        private string _categoria;
        private string _subCategoria;
        private string _catalogoNum;
        private string _divisaBase;
        private string _notaAforo;
        private float _tasaCambio;
        private string _seguimiento1;
        private string _seguimiento2;
        private string _cotizacionNum;
        private string _estado;
        private DateTime _fechaEmision;
        private DateTime _fechaAprovacion;
        private DateTime _validaHasta;
        private int _actualizaciones;
        private int _idCatalogo; // otra clase con las propiedades del catalogo
        private string _obsComprador;
        private string _obsVendedor;
        private int _catidad1;
        private int _cantidad2;
        private string _unidad1;
        private string _unidad2;
        private float _subtotal;
        private int _descuento;
        private float _valorDescuento;
        private float _total;
        private float _montoFacturable;
        private int _iva;
        private float _valorIva;
        private float _totalBruto;
        private float _gastosComprador;
        private float _totalGlobal;
        private int _interes;
        private float _valorInteres;
        private float _totalPagar1;
        private float _totalPagar2;











        public string catalogoNum
        {
            get { return _catalogoNum; }
            set { _catalogoNum = value; }
        }



    }
}