<%@ Page Title="" Language="C#" MasterPageFile="~/MP.Master" AutoEventWireup="true" CodeBehind="ABMEmpleado.aspx.cs" Inherits="ProyectoFinalBios2019.ABMEmpleado" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <style type="text/css">

        .style12
        {
            height: 5px;
            text-align: center;
        }
        .style14
        {
            height: 5px;
            width: 177px;
        }
        .style11
        {
            height: 5px;
            width: 243px;
        }
        .style10
        {
            height: 5px;
        }
        .style9
        {
            height: 5px;
            text-align: center;
        }
        </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <table border="0" style="width: 100%; height: 76px;">
    <tr>
        <td class="style12" colspan="3">
            <asp:Label ID="Titulo" runat="server" 
                    style="text-decoration: underline; font-weight: 700; font-size: xx-large; text-align: center" 
                    Text="ABM Empleado"></asp:Label>
        </td>
    </tr>
    <tr>
        <td class="style14">
            <asp:Label ID="lblCI" runat="server" Text="CI:"></asp:Label>
        </td>
        <td class="style11">
            <asp:TextBox ID="TboxCi" runat="server" Width="170px"></asp:TextBox>
            <asp:Button ID="BtnBuscar" runat="server"
                    Text="Buscar" onclick="BtnBuscar_Click" />
        </td>
        <td class="style10">
            <asp:RequiredFieldValidator ID="RfvCI" runat="server" BorderColor="#CC0000" 
                    ControlToValidate="TboxCi" ErrorMessage="Campo Requerido"></asp:RequiredFieldValidator>
        &nbsp;<br />
            <asp:RegularExpressionValidator ID="RevCi7digitos" runat="server"  ValidationExpression="\d{7}"
                ErrorMessage="Ingrese una CI con 7 digitos" ControlToValidate="TboxCi"></asp:RegularExpressionValidator>
        </td>
    </tr>
    <tr>
        <td class="style14">
            <asp:Label ID="lblNombreEmp" runat="server" Text="Nombre de Empleado:"></asp:Label>
        </td>
        <td class="style11">
            <asp:TextBox ID="TboxNomEmp" runat="server" Width="235px"></asp:TextBox>
        </td>
        <td class="style10">
            <asp:RequiredFieldValidator ID="RfvNombre" runat="server" BorderColor="#CC0000" 
                    ControlToValidate="TboxNomEmp" ErrorMessage="Campo Requerido"></asp:RequiredFieldValidator>
        </td>
    </tr>
    <tr>
        <td class="style14">
            <asp:Label ID="lblPassword" runat="server" Text="Password:"></asp:Label>
        </td>
        <td class="style11">
            <asp:TextBox ID="TboxPassword" runat="server" Width="235px"></asp:TextBox>
        </td>
        <td class="style10">
            <asp:RequiredFieldValidator ID="RfvPassword" runat="server" 
                    BorderColor="#CC0000" ControlToValidate="TboxPassword" 
                    ErrorMessage="Campo Requerido"></asp:RequiredFieldValidator>
        </td>
    </tr>
    <tr>
        <td class="style9" colspan="3">
            <asp:Button ID="BtnAgregarEmp" runat="server" Text="Agregar" Width="100px" 
                onclick="BtnAgregarEmp_Click" />
&nbsp;<asp:Button ID="BtnModificarEmp" runat="server" Text="Modificar" Width="100px" 
                onclick="BtnModificarEmp_Click" />
&nbsp;<asp:Button ID="BtnEliminarEmp" runat="server" Text="Eliminar" Width="100px" 
                onclick="BtnEliminarEmp_Click"/>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                <asp:Button ID="BtnLimpio" runat="server" Text="Limpiar" Width="100px" 
                onclick="BtnLimpio_Click" />
        </td>
    </tr>
    <tr>
        <td class="style12" colspan="3">
            <asp:Label ID="lblError" runat="server"></asp:Label>
        </td>
    </tr>
    <tr>
        <td class="style9" colspan="3">
                &nbsp;<asp:HyperLink ID="LinkVolver" runat="server" 
                    NavigateUrl="~/Principal.aspx">Volver</asp:HyperLink>
&nbsp;
                </td>
    </tr>
</table>
</asp:Content>
