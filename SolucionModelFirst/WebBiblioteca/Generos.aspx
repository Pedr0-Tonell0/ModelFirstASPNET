<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Generos.aspx.cs" Inherits="WebBiblioteca.Generos" %>
<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
    <br />
    <div>
        <table style="width: 100%; height: 90px;">
            <tr>
                <td class="text-right" style="width: 164px; border-style: double; border-width: 2px">
                    <asp:Label ID="lblID" runat="server" Text="ID Genero:"></asp:Label>
                </td>
                <td style="width: 207px; border-style: double; border-width: 2px">
                    <asp:Label ID="lblContenidoID" runat="server" Text="(ID)"></asp:Label>
                </td>
                <td style="border-style: double; border-width: 2px">
                    &nbsp;</td>
            </tr>
            <tr>
                <td class="text-right" style="width: 164px; border-style: double; border-width: 2px">
                    <asp:Label ID="lblNombre" runat="server" Text="Nombre :"></asp:Label>
                </td>
                <td style="width: 207px; border-style: double; border-width: 2px">
                    <asp:TextBox ID="txtNombre" runat="server" Width="192px"></asp:TextBox>
                </td>
                <td style="border-style: double; border-width: 2px">
                    <asp:RequiredFieldValidator ID="rfvNombre" runat="server" ControlToValidate="txtNombre" ErrorMessage="el nombre es obligatorio!!!" Font-Bold="True" ForeColor="#FF3300"></asp:RequiredFieldValidator>
                </td>
            </tr>
            <tr>
                <td class="text-right" style="width: 164px; border-style: double; border-width: 2px">
                    <asp:Button ID="btnNuevo" runat="server" Text="Nuevo" Width="162px" OnClick="btnNuevo_Click" />
                </td>
                <td style="width: 207px; border-style: double; border-width: 2px">
                    <asp:Button ID="btnModificar" runat="server" Text="Modificar" Width="200px" OnClick="btnModificar_Click" />
                </td>
                <td style="border-style: double; border-width: 2px">
                    <asp:Button ID="btnBorrar" runat="server" Text="Borrar" OnClick="btnBorrar_Click" />
                </td>
            </tr>
        </table>
        <br />
        <asp:GridView ID="gvGeneros" runat="server" Width="560px" BackColor="White" BorderColor="#DEDFDE" BorderStyle="None" BorderWidth="1px" Caption="Lista de generos" CellPadding="4" EmptyDataText="sin datos" ForeColor="Black" GridLines="Vertical" AutoGenerateSelectButton="True" OnSelectedIndexChanged="gvGeneros_SelectedIndexChanged">
            <AlternatingRowStyle BackColor="White" />
            <FooterStyle BackColor="#CCCC99" />
            <HeaderStyle BackColor="#6B696B" Font-Bold="True" ForeColor="White" />
            <PagerStyle BackColor="#F7F7DE" ForeColor="Black" HorizontalAlign="Right" />
            <RowStyle BackColor="#F7F7DE" />
            <SelectedRowStyle BackColor="#CE5D5A" Font-Bold="True" ForeColor="White" />
            <SortedAscendingCellStyle BackColor="#FBFBF2" />
            <SortedAscendingHeaderStyle BackColor="#848384" />
            <SortedDescendingCellStyle BackColor="#EAEAD3" />
            <SortedDescendingHeaderStyle BackColor="#575357" />
        </asp:GridView>
    </div>

</asp:Content>
