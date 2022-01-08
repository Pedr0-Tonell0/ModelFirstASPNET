using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;

namespace WebBiblioteca
{
    public class Utilidad:Page
    {
        public void MsgBox(string pMensaje)
        {
            string msj = "<script language='Javascript'> alert('" + pMensaje + "');</script>";
            Page.ClientScript.RegisterStartupScript(Page.GetType(), "mensaje", msj);

        }
    }
}