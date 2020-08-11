<%@ Page Title="" Language="C#" MasterPageFile="~/MP.Master" AutoEventWireup="true" CodeBehind="CambioEstadoSolicitud.aspx.cs" Inherits="ProyectoFinalBios2019.CambioEstadoSolicitud" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <style type="text/css">
    .style5
    {
        height: 23px;
        text-align: center;
    }
</style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <table style="width:100%;">
    <tr>
        <td>
            &nbsp;</td>
        <td colspan="3">
            &nbsp;</td>
        <td>
            &nbsp;</td>
    </tr>
    <tr>
        <td>
            &nbsp;</td>
        <td colspan="3">
            <asp:GridView ID="GridView1" runat="server" Width="865px" 
                style="text-align: center" 
                onselectedindexchanged="GridView1_SelectedIndexChanged" 
                onrowcommand="GridView1_RowCommand">
                <Columns>
                    <asp:ButtonField InsertVisible="true" Text="Ejecutada" ButtonType="Button" 
                        CommandName="BtnEjecutar" />
                    <asp:ButtonField InsertVisible="true" Text="Anulada" ButtonType="Button" 
                        CommandName="BtnAnulada" />
                </Columns>
            </asp:GridView>
        </td>
        <td>
            &nbsp;</td>
    </tr>
    <tr>
        <td>
            &nbsp;</td>
        <td colspan="3">
            &nbsp;</td>
        <td>
            &nbsp;</td>
    </tr>
    <tr>
        <td>
            &nbsp;</td>
        <td style="text-align: right">
            &nbsp;</td>
        <td style="text-align: right">
            &nbsp;</td>
        <td>
            &nbsp;</td>
        <td>
            &nbsp;</td>
    </tr>
    <tr>
        <td>
            &nbsp;</td>
        <td colspan="3">
            &nbsp;</td>
        <td>
            &nbsp;</td>
    </tr>
    <tr>
        <td class="style5">
        </td>
        <td class="style5">
        </td>
        <td class="style5">
            <asp:Label ID="lblError" runat="server"></asp:Label>
        </td>
        <td class="style5">
        </td>
        <td class="style5">
        </td>
    </tr>
    <tr>
        <td class="style5">
            &nbsp;</td>
        <td class="style5" colspan="3">
            <asp:HyperLink ID="HyperLink1" runat="server" NavigateUrl="~/Principal.aspx">Volver</asp:HyperLink>
        </td>
        <td class="style5">
            &nbsp;</td>
    </tr>
    </table>
</asp:Content>
