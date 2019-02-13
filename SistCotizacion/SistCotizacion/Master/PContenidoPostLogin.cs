using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace SistCotizacion.Master
{
    public class PContenidoPostLogin
    {
        public void MostrarMensaje(String vMensaje, String vTitulo = "Información")
        {
            NavContenido vM = new NavContenido();
            vM.MostrarMensaje(vMensaje, vTitulo);
        }


        public void MostrarError(String vMensaje, String vTitulo = "Error", Exception vException = null)
        {
            //NavContenido vM = (NavContenido)NavContenido;
            //vM.MostrarError(vMensaje, vTitulo, vException);
        }

    //    public void enviarCorreo(String vCorreos, String pMensajeCorreo)
    //    {

    //        try
    //        {
    //            //Dim SendFrom As MailAddress = New MailAddress("its@essbio.cl")
    //            //Dim SendTo As MailAddress = New MailAddress(String.Empty)
    //            //Dim SendCC As MailAddress = New MailAddress(txtCC.Text)

    //            MailMessage MyMessage = new MailMessage();
    //            MyMessage.From = new MailAddress("Contacto@biodiversa.com");
    //            MyMessage.To.Add(vCorreos);
    //            MyMessage.Subject = " Solicitud Biodiversa";
    //            MyMessage.Body = pMensajeCorreo;

    //            //Dim attachFile As New Attachment(txtAttachmentPath.Text)
    //            //MyMessage.Attachments.Add(attachFile)
    //            //NetworkCredential basicCredential = new NetworkCredential("jessen.diaz@waypro.cl", "Eia59742"); 
    //            SmtpClient emailClient = new SmtpClient("smtp.aguas.local");
    //            //emailClient.UseDefaultCredentials = false;
    //            //emailClient.Credentials = basicCredential;
    //            emailClient.Send(MyMessage);

    //            //litStatus.Text = "Message Sent"
    //        }
    //        catch (Exception ex)
    //        {
    //            MostrarError(ex.Message);
    //        }
    //    }
        }
}
