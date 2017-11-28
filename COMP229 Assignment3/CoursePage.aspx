<%@ Page Title="" Language="C#" MasterPageFile="~/Site1.Master" AutoEventWireup="true" CodeBehind="CoursePage.aspx.cs" Inherits="COMP229_Assignment3.CoursePage" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">

</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">
   <div class="row" >

    <div class="col-md-4">

        <asp:DataList ID="coursesList" runat="server">
                    <HeaderTemplate>
                <h1>Course </h1>
            </HeaderTemplate>
            <ItemTemplate>
                <p><%# Eval("Title")%> </p>
            </ItemTemplate>
        </asp:DataList>
    </div>
</div>

 <asp:Button ID="Button1" runat="server" Text="Update" />
    <asp:Button ID="Button2" runat="server" Text="Delete" />
</asp:Content>
