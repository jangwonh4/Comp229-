<%@ Page Title="" Language="C#" MasterPageFile="~/Site1.Master" AutoEventWireup="true" CodeBehind="CoursePage.aspx.cs" Inherits="COMP229_Assignment3.CoursePage" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">

</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">
    
    <div>
        <table>
        <asp:HiddenField ID="StudentID" runat="server" />
        <tr>
            <td>
                <asp:Label ID="label1" runat="server" Text="Label"></asp:Label>
            </td>
            <td colspan="2">
                <asp:TextBox ID="TextBox1" runat="server"></asp:TextBox>
            </td>
            <td>
                <asp:Label ID="label2" runat="server" Text="Label"></asp:Label>
            </td>
            <td colspan="2">
                <asp:TextBox ID="TextBox2" runat="server"></asp:TextBox>
            </td>
            <td>
                <asp:Label ID="label3" runat="server" Text="Label"></asp:Label>
            </td>
            <td colspan="2">
                <asp:TextBox ID="TextBox3" runat="server"></asp:TextBox>
            </td>

        </tr>
        </table>
    </div>
    <asp:Button ID="Button1" runat="server" Text="Update" />
    <asp:Button ID="Button2" runat="server" Text="Delete" />
</asp:Content>
