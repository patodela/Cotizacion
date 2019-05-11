using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace MSSQLSUL.Seguridad
{

    public enum EstadoUsuario
    {
        NoLogeado = 0,
        Logeado = 1,
        PassExpirado = 2
    }
    public enum nombreTabla
    {
        ORGANIZADOR = 1,
        FAMILIA = 2,
        VAR_PRINCIPAL_GRUPO = 3,
        VAR_PRINCIPAL_ARTICULO = 4,
        VCP_CARACTERISTICA_1 = 5,
        VCP_CARACTERISTICA_2 = 6,
        VCP_CARACTERISTICA_3 = 7,
        VAR_CUANTIFICACION_SECUNDARIA = 8,
        VAR_CUANTI_COMBINACION_1 = 9,
        VAR_CUANTI_COMBINACION_2 = 10,
        VAR_IDENTI_COMBINACION_1 = 11,
        VAR_IDENTI_COMBINACION_2 = 12,
        VAR_IDENTI_CAR1 = 13
    }

  public  enum  LimiteTabla
    {
        VAR_PRINCIPAL_GRUPO = 99,
        VAR_PRINCIPAL_ARTICULO = 999,
        VCP_CARACTERISTICA_1 = 999,
        VCP_CARACTERISTICA_2 = 99,
        VCP_CARACTERISTICA_3 = 99,
        VAR_CUANTIFICACION_SECUNDARIA = 99,
        VAR_CUANTI_COMBINACION_1 = 999,
        VAR_CUANTI_COMBINACION_2 = 999,
        VAR_IDENTI_COMBINACION_1 = 99,
        VAR_IDENTI_COMBINACION_2 = 99,
        VAR_IDENTI_CAR1 = 99

    }
}
        

