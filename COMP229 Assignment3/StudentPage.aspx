<%@ Page Title="" Language="C#" MasterPageFile="~/Site1.Master" AutoEventWireup="true" CodeBehind="StudentPage.aspx.cs" Inherits="COMP229_Assignment3.StudentPage" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <p>1</p>
    <p>1</p>
    <p>1</p>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">

    <asp:DataList ID="studentsList" runat="server">
        <ItemTemplate>
            <table id="studentTable" runat="server">
                <tr>
                    <td>Student ID: </td>
                    <td><strong><%#Eval("StudentID")%></strong></td>
                </tr>
                <tr>
                    <td>Name:</td>
                    <td><strong><%#Eval("FirstMidName")%></strong> <strong><%#Eval("LastName")%></strong></td>
                </tr>
                <tr>
                    <td>Enroll:</td>
                    <td><strong><%#Eval("EnrollmentDate")%></strong></td>
                </tr>
            </table>
        </ItemTemplate>
        <SeparatorTemplate>
            <hr />
        </SeparatorTemplate>
    </asp:DataList>

</asp:Content>
