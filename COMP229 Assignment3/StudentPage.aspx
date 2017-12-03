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

    <div class="container margin" >
         <h3 class="margin" >Register New Student</h3>
            <div class="row">
                <div class="col-sm-3"></div>
                <div class="col-sm-3">
                    <asp:Label ID="FName" runat="server" Text="Label">First Name :</asp:Label>
                </div>
                <div class="col-sm-3">
                    <asp:TextBox ID="BoxFName" runat="server" ></asp:TextBox>
                    <asp:RequiredFieldValidator ID="FirstNameRequiredVal" runat="server" ErrorMessage="Fill out" ValidationGroup="InsertValidation" ControlToValidate="BoxFName" ForeColor="Red">*Must be filled out</asp:RequiredFieldValidator>
                </div>
                <div class="col-sm-3"></div>
            </div>

            <div class="row">
                <div class="col-sm-3"></div>
                <div class="col-sm-3">
                    <asp:Label ID="LName" runat="server" Text="Label" >Last Name :</asp:Label>
                </div>
                <div class="col-sm-3">
                    <asp:TextBox ID="BoxLName" runat="server" ></asp:TextBox>
                    <asp:RequiredFieldValidator ID="LastNameRequiredVal" runat="server" ErrorMessage="Fill out" ValidationGroup="InsertValidation" ControlToValidate="BoxLName" ForeColor="Red">*Must be filled out</asp:RequiredFieldValidator>

                </div>
                <div class="col-sm-3"></div>
            </div>

            <div class="row " >
                
                <div class="col-sm-4"></div>
                <div class="col-sm-2">
                     <asp:Button ID="Button1" runat="server" Text="Add New Student"  CssClass="btn btn-default btn-lg bg-2" OnClick="btnDone_Click" ValidationGroup="InsertValidation" />

                </div>
            </div>

</asp:Content>
