<%@ Page Title="" Language="C#" MasterPageFile="~/Site1.Master" AutoEventWireup="true" CodeBehind="StudentPage.aspx.cs" Inherits="COMP229_Assignment3.StudentPage" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">

    
        <asp:DataList ID="studentsList" runat="server">
        <ItemTemplate>
            <table class="table table-inverse">
  <thead>
    <tr>
      <th>StudentID</th>
      <th>Name</th>
      <th>Enroll</th>
    </tr>
  </thead>
  <tbody>
    <tr>
      
      <td><strong><%#Eval("StudentID")%></strong></td>
      <td><strong><%#Eval("FirstMidName")%></strong> <strong><%#Eval("LastName")%></strong></td>
      <td><strong><%#Eval("EnrollmentDate")%></strong></td>
    </tr>
    </tbody>
</table>

        </ItemTemplate>
        <SeparatorTemplate>
            <hr />
        </SeparatorTemplate>
    </asp:DataList>

</asp:Content>
