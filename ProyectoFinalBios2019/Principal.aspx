<%@ Page Title="" Language="C#" MasterPageFile="~/MP.Master" AutoEventWireup="true" CodeBehind="Principal.aspx.cs" Inherits="ProyectoFinalBios2019.Principal" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <style type="text/css">
    .style2
    {
        text-align: right;
    }
</style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div>
    <table style="width:100%;">
        <tr>
            <td class="style2" colspan="2">
                    <asp:HyperLink ID="HLinkLogin" runat="server" NavigateUrl="LoginEmp.aspx">Iniciar Sesion</asp:HyperLink>
&nbsp;/
                    <asp:HyperLink ID="HLinkConsultaEstadoSoli" runat="server" 
                        NavigateUrl="~/ConsultaEstadoSolicitud.aspx">Consultar Estado de Solicitud</asp:HyperLink>
                    </td>
        </tr>
        <tr>
            <td class="style3">
                    &nbsp;</td>
            <td class="style1">
                    &nbsp;</td>
        </tr>
    </table>
</div>
<asp:GridView ID="GridView1" runat="server" Width="1003px" 
        onselectedindexchanged="GridView1_SelectedIndexChanged">
    <Columns>
        <asp:CommandField ShowSelectButton="True" />
    </Columns>
</asp:GridView>
    <br />
    <asp:GridView ID="GridView2" runat="server" Width="1003px">
    </asp:GridView>
</asp:Content>
