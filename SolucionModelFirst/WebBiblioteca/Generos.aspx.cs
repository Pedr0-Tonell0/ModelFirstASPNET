using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace WebBiblioteca
{
    public partial class Generos : Utilidad
    {
        Logica.Genero logicaGenero = new Logica.Genero();
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!Page.IsPostBack)
            {
                TraerGeneros();
            }
        }
        void TraerGeneros()
        {
            gvGeneros.DataSource = logicaGenero.TraerTodos();
            gvGeneros.DataBind();
        }

        protected void btnNuevo_Click(object sender, EventArgs e)
        {
            Entidades.Genero entidadGenero = new Entidades.Genero();
            entidadGenero.Nombre = txtNombre.Text;
            try
            {
                logicaGenero.Agregar(entidadGenero);
                TraerGeneros();

            }
            catch (Exception ex)
            {
                MsgBox(ex.Message);

            }

        }

        protected void gvGeneros_SelectedIndexChanged(object sender, EventArgs e)
        {
            // codigo por cada seleccion
            GridViewRow filaSeleccionada = gvGeneros.SelectedRow;
            // traigo el id
            int intId = Convert.ToInt32(filaSeleccionada.Cells[1].Text);
            // con ese id, invoco al metodo TraerxId
            Entidades.Genero genero = logicaGenero.TraerxId(intId);
            lblContenidoID.Text = genero.Id.ToString();
            txtNombre.Text = genero.Nombre;

        }

        protected void btnModificar_Click(object sender, EventArgs e)
        {
            Entidades.Genero entidadGenero = new Entidades.Genero();
            entidadGenero.Id = Convert.ToInt32(lblContenidoID.Text);
            entidadGenero.Nombre = txtNombre.Text;
            logicaGenero.Modificar(entidadGenero);
            MsgBox("Genero Modificado");
            TraerGeneros();
        }

        protected void btnBorrar_Click(object sender, EventArgs e)
        {
            int intID = Convert.ToInt32(lblContenidoID.Text);
            Entidades.Genero genero = logicaGenero.TraerxId(intID);
            try
            {
                logicaGenero.Borrar(genero);
                MsgBox("Genero Borrado");
                TraerGeneros();
            }
            catch (Exception)
            {

                MsgBox("No se pudo borrar el genero!!!");

            }
        }
    }
}